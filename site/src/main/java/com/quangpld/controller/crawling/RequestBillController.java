package com.quangpld.controller.crawling;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.email.service.EmailService;
import org.broadleafcommerce.common.email.service.info.EmailInfo;
import org.broadleafcommerce.common.web.BroadleafRequestContext;
import org.broadleafcommerce.common.web.controller.BroadleafAbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quangpld.form.RequestBillForm;
import com.quangpld.utils.CommonUtils;

@Controller
@RequestMapping("/yeu-cau-bao-gia")
public class RequestBillController extends BroadleafAbstractController {

    private static final Log LOG = LogFactory.getLog(RequestBillController.class);

    @Resource(name = "blEmailService")
    protected EmailService emailService;

    @Resource(name = "dh24hCrawlingEmailInfo")
    protected EmailInfo dh24hCrawlingEmailInfo;

    public EmailInfo getDh24hCrawlingEmailInfo() {
        return dh24hCrawlingEmailInfo;
    }

    public void setDh24hCrawlingEmailInfo(EmailInfo dh24hCrawlingEmailInfo) {
        this.dh24hCrawlingEmailInfo = dh24hCrawlingEmailInfo;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String requestBill(HttpServletRequest request, HttpServletResponse response, Model model,
                              @ModelAttribute("requestBillForm") RequestBillForm requestBillForm) {
        model.addAttribute("fullname", requestBillForm.getFullname());
        model.addAttribute("address", requestBillForm.getAddress());
        model.addAttribute("email", requestBillForm.getEmail());
        model.addAttribute("phone", requestBillForm.getPhone());
        model.addAttribute("crawling_productTitle", requestBillForm.getProductName());
        model.addAttribute("crawling_productLink", requestBillForm.getProductLink());
        model.addAttribute("crawling_productImages", requestBillForm.getProductImages());
        model.addAttribute("crawling_productExtraInformation", requestBillForm.getProductExtraInformation());

        // Send notification email.
        HashMap<String, Object> vars = new HashMap<String, Object>();
        vars.put("crawling_productTitle", requestBillForm.getProductName());
        vars.put("crawling_productLink", requestBillForm.getProductLink());
        vars.put("crawling_productImages", requestBillForm.getProductImages());
        vars.put("productExtraInformation", requestBillForm.getProductExtraInformation());
        vars.put("crawling_currency", requestBillForm.getCurrency());
        vars.put("crawling_productCost", CommonUtils.getDisplayCost(requestBillForm.getWebPrice(), true));
        //vars.put("crawling_productCategory", requestBillForm.get);
        vars.put("crawling_productImportTax", CommonUtils.getDisplayCost(requestBillForm.getImportTax(), true));
        vars.put("crawling_productShippingCost", CommonUtils.getDisplayCost(requestBillForm.getShippingCost(), true));
        vars.put("crawling_prepaidValues", requestBillForm.getPrePaids());
        vars.put("crawling_exchangeRate", requestBillForm.getExchangeRate());
        vars.put("crawling_productTaxAndShippingCost", CommonUtils.getDisplayCost(requestBillForm.getShippingAndTaxInternationalCost(), true));
        vars.put("crawling_processOrderingCosts", CommonUtils.getDisplayCosts(requestBillForm.getOrderingCosts(), true));
        vars.put("crawling_finalCosts", CommonUtils.getDisplayCosts(requestBillForm.getFinalCosts(), true));
        vars.put("crawling_finalCostsVND", CommonUtils.getDisplayCosts(requestBillForm.getFinalCostsVND(), false));
        vars.put("crawling_prepaidValuesVND", CommonUtils.getDisplayCosts(requestBillForm.getPrePaidsVND(), false));
        vars.put("crawling_remainingCostsVND", CommonUtils.getDisplayCosts(requestBillForm.getRemainingCosts(), false));
        vars.put("fullname", requestBillForm.getFullname());
        vars.put("address", requestBillForm.getAddress());
        vars.put("email", requestBillForm.getEmail());
        vars.put("phone", requestBillForm.getPhone());

        //Email service failing should not trigger rollback
        try {
            BroadleafRequestContext broadleafRequestContext = BroadleafRequestContext.getBroadleafRequestContext();
            String subject = broadleafRequestContext.getMessageSource().getMessage("crawling.email.requestBill.title",
                                                                                   new Object[] { requestBillForm.getHostname() },
                                                                                   broadleafRequestContext.getJavaLocale());
            EmailInfo emailInfo = getDh24hCrawlingEmailInfo();
            emailInfo.setSubject(subject);
            emailService.sendTemplateEmail("dathang24h.net@gmail.com", emailInfo, vars);
        } catch (Exception e) {
            LOG.error(e);
        }

        return "crawling/requestBillSuccess";
    }
}
