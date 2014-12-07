package com.quangpld.controller.crawling;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.email.service.EmailService;
import org.broadleafcommerce.common.email.service.info.EmailInfo;
import org.broadleafcommerce.common.util.BLCSystemProperty;
import org.broadleafcommerce.common.web.BroadleafRequestContext;
import org.broadleafcommerce.common.web.controller.BroadleafAbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quangpld.crawling.Crawler;
import com.quangpld.crawling.CrawlerFactory;
import com.quangpld.form.CrawlingForm;
import com.quangpld.utils.AppConstants;
import com.quangpld.utils.CommonUtils;
import com.quangpld.utils.HttpUtils;

@Controller
@RequestMapping("/bao-gia-tu-dong")
public class CrawlingController extends BroadleafAbstractController {

    private static final Log LOG = LogFactory.getLog(CrawlingController.class);

    @Resource(name = "blEmailService")
    protected EmailService emailService;

    @Resource(name = "dh24hCrawlingEmailInfo")
    protected EmailInfo dh24hCrawlingEmailInfo;

    protected static String crawlingSuccessView = "crawling/crawlingSuccess";

    public EmailInfo getDh24hCrawlingEmailInfo() {
        return dh24hCrawlingEmailInfo;
    }

    public void setDh24hCrawlingEmailInfo(EmailInfo dh24hCrawlingEmailInfo) {
        this.dh24hCrawlingEmailInfo = dh24hCrawlingEmailInfo;
    }

    public String getCrawlingSuccessView() {
        return crawlingSuccessView;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String register(HttpServletRequest request, HttpServletResponse response, Model model,
                           @ModelAttribute("crawlingForm") CrawlingForm crawlingForm) {
        String redirectUrl = request.getParameter("successUrl");
        if (!StringUtils.isEmpty(redirectUrl)) {
            crawlingForm.setRedirectUrl(redirectUrl);
        }

        // Get appropriate crawler.
        Crawler crawler = null;
        try {
            String hostname = HttpUtils.getHostName(crawlingForm.getLink());
            crawler = CrawlerFactory.instance().createCrawler(hostname);
            if (crawler != null) {
                crawler.setProductUrl(crawlingForm.getLink());
                model.addAttribute("crawling_hostname", hostname);

                String productTitle = crawler.getProductTitle();
                List<String> productImages = crawler.getProductImages();
                model.addAttribute("crawling_productTitle", productTitle);
                model.addAttribute("crawling_productImages", productImages);

                String currency = crawler.getCurrency();
                Double productCost = crawler.getProductCost();
                String productCategory = crawler.getProductCategory();
                Double productImportTax = crawler.getProductImportTax();
                Double productShippingCost = crawler.getProductShippingCost();
                List<Double> processOrderingCosts = crawler.getProcessOrderingCosts();
                List<Double> prepaidValues = crawler.getPrepaidValues();

                Double exchangeRate = null;
                if (AppConstants.CURRENCY_SYMBOL_DOLLAR_SIGN.equals(currency)) {
                    try {
                        exchangeRate = Double.parseDouble(BLCSystemProperty.resolveSystemProperty("Crawling.ExchangeRateUSDVND"));
                    } catch (NumberFormatException nfe) {
                        LOG.error(nfe);
                    }
                }

                if (StringUtils.isEmpty(currency) || productCost == null || StringUtils.isEmpty(productCategory) || 
                    productImportTax == null || productShippingCost == null || processOrderingCosts == null ||
                    processOrderingCosts.size() == 0 || prepaidValues == null || prepaidValues.size() == 0 ||
                    exchangeRate == null) {
                    return getCrawlingSuccessView();
                }

                model.addAttribute("crawling_currency", currency);
                model.addAttribute("crawling_productCost", CommonUtils.getDisplayCost(productCost, true));
                model.addAttribute("crawling_productCategory", productCategory);
                model.addAttribute("crawling_productImportTax", CommonUtils.getDisplayCost(productImportTax, true));
                model.addAttribute("crawling_productShippingCost", CommonUtils.getDisplayCost(productShippingCost, true));
                model.addAttribute("crawling_prepaidValues", prepaidValues);
                model.addAttribute("crawling_exchangeRate", CommonUtils.getDisplayCost(exchangeRate, false));

                Double productTaxAndShippingCost = crawler.getProductTaxAndShippingFee();
                model.addAttribute("crawling_productTaxAndShippingCost", CommonUtils.getDisplayCost(productTaxAndShippingCost, true));

                List<Double> finalCosts = new ArrayList<Double>();
                List<Double> processOrderingFinalCosts = new ArrayList<Double>();
                for (Double processOrderingCost : processOrderingCosts) {
                    double finalCost = 0;
                    finalCost += productCost;
                    finalCost += productImportTax;
                    finalCost += productTaxAndShippingCost != null ? productTaxAndShippingCost : 0;
                    finalCost += productShippingCost;
                    finalCost += processOrderingCost != null ? processOrderingCost : 0;

                    Double categoryProductMinShippingCost = crawler.getCategoryProductMinShippingCost();
                    if (categoryProductMinShippingCost != null &&
                        (productImportTax + productShippingCost + (processOrderingCost != null ? processOrderingCost : 0) < categoryProductMinShippingCost)) {
                        double additionalCost = categoryProductMinShippingCost - (productImportTax + productShippingCost + (processOrderingCost != null ? processOrderingCost : 0));
                        if (processOrderingCost != null) {
                            processOrderingCost += additionalCost;
                        } else {
                            processOrderingCost = additionalCost;
                        }
                        finalCost += additionalCost;
                    }

                    processOrderingFinalCosts.add(processOrderingCost);
                    finalCosts.add(finalCost);
                }
                model.addAttribute("crawling_processOrderingCosts", CommonUtils.getDisplayCosts(processOrderingFinalCosts, true));
                model.addAttribute("crawling_finalCosts", CommonUtils.getDisplayCosts(finalCosts, true));

                List<Double> finalCostsVND = new ArrayList<Double>();
                if (finalCosts.size() > 0) {
                    for (Double finalCost : finalCosts) {
                        if (exchangeRate != null && finalCost != null) {
                            finalCostsVND.add(finalCost * exchangeRate);
                        }
                    }
                }
                model.addAttribute("crawling_finalCostsVND", CommonUtils.getDisplayCosts(finalCostsVND, false));
                model.addAttribute("crawling_finalCostsVNDRawData", finalCostsVND);

                List<Double> prepaidValuesVND = new ArrayList<Double>();
                if (finalCostsVND.size() > 0 && finalCostsVND.size() == prepaidValues.size()) {
                    for (int i = 0; i < finalCostsVND.size(); i++) {
                        if (prepaidValues.get(i) != null && finalCostsVND.get(i) != null) {
                            prepaidValuesVND.add(prepaidValues.get(i) * finalCostsVND.get(i) / 100);
                        }
                    }
                }
                model.addAttribute("crawling_prepaidValuesVND", CommonUtils.getDisplayCosts(prepaidValuesVND, false));
                model.addAttribute("crawling_prepaidValuesVNDRawData", prepaidValuesVND);

                List<Double> remainingCostsVND = new ArrayList<Double>();
                if (finalCostsVND.size() > 0 && finalCostsVND.size() == prepaidValuesVND.size()) {
                    for (int i = 0; i < finalCostsVND.size(); i++) {
                        if (finalCostsVND.get(i) != null && prepaidValuesVND.get(i) != null) {
                            remainingCostsVND.add(finalCostsVND.get(i) - prepaidValuesVND.get(i));
                        }
                    }
                }
                model.addAttribute("crawling_remainingCostsVND", CommonUtils.getDisplayCosts(remainingCostsVND, false));
                model.addAttribute("crawling_remainingCostsVNDRawData", remainingCostsVND);

                // Send notification email.
                HashMap<String, Object> vars = new HashMap<String, Object>();
                vars.put("crawling_productTitle", productTitle);
                vars.put("crawling_productLink", crawlingForm.getLink());
                vars.put("crawling_productImages", productImages);
                vars.put("crawling_currency", currency);
                vars.put("crawling_productCost", CommonUtils.getDisplayCost(productCost, true));
                vars.put("crawling_productCategory", productCategory);
                vars.put("crawling_productImportTax", CommonUtils.getDisplayCost(productImportTax, true));
                vars.put("crawling_productShippingCost", CommonUtils.getDisplayCost(productShippingCost, true));
                vars.put("crawling_prepaidValues", prepaidValues);
                vars.put("crawling_exchangeRate", CommonUtils.getDisplayCost(exchangeRate, false));
                vars.put("crawling_productTaxAndShippingCost", CommonUtils.getDisplayCost(productTaxAndShippingCost, true));
                vars.put("crawling_processOrderingCosts", CommonUtils.getDisplayCosts(processOrderingFinalCosts, true));
                vars.put("crawling_finalCosts", CommonUtils.getDisplayCosts(finalCosts, true));
                vars.put("crawling_finalCostsVND", CommonUtils.getDisplayCosts(finalCostsVND, false));
                vars.put("crawling_prepaidValuesVND", CommonUtils.getDisplayCosts(prepaidValuesVND, false));
                vars.put("crawling_remainingCostsVND", CommonUtils.getDisplayCosts(remainingCostsVND, false));

                //Email service failing should not trigger rollback
                try {
                    BroadleafRequestContext broadleafRequestContext = BroadleafRequestContext.getBroadleafRequestContext();
                    String subject = broadleafRequestContext.getMessageSource().getMessage("crawling.email.crawling.title",
                                                                                           new Object[] { request.getRemoteAddr() },
                                                                                           broadleafRequestContext.getJavaLocale());
                    EmailInfo emailInfo = getDh24hCrawlingEmailInfo();
                    emailInfo.setSubject(subject);
                    emailService.sendTemplateEmail("dathang24h.net@gmail.com", emailInfo, vars);
                } catch (Exception e) {
                    LOG.error(e);
                }
            }
        } catch (Exception e) {
            LOG.error(e);
        }

        return getCrawlingSuccessView();
    }

}
