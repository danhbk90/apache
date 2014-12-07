package com.quangpld.crawling;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;

import com.quangpld.utils.AppConstants;
import com.quangpld.utils.CommonUtils;

public class AmazonCrawler extends AbstractCrawler {

    private static final Log LOG = LogFactory.getLog(AmazonCrawler.class);
    public static final String HOST_NAME = "www.amazon.com";
    public static final String SYSTEM_PROPERTY_KEY_PRODUCT_TITLE_NODE = "Crawling.AmazonProductTitleNodes";
    public static final String SYSTEM_PROPERTY_KEY_CATEGORY_NODE = "Crawling.AmazonCategoryNodes";
    public static final String SYSTEM_PROPERTY_KEY_PRODUCT_COST_NODE = "Crawling.AmazonProductCostNodes";
    public static final String SYSTEM_PROPERTY_KEY_PRODUCT_TAX_AND_SHIPPING_COST_NODE = "Crawling.AmazonProductTaxAndShippingCostNodes";
    public static final String SYSTEM_PROPERTY_KEY_PRODUCT_WEIGHT_NODE = "Crawling.AmazonProductWeightNodes";
    public static final String SYSTEM_PROPERTY_KEY_PRODUCT_IMAGE = "Crawling.AmazonProductImagesNodes";

    static {
        try {
            CrawlerFactory.registerProduct(HOST_NAME, new AmazonCrawler());
        } catch (Exception e) {
        }
    }

    public AmazonCrawler() throws Exception {
    }

    @Override
    public Crawler createCrawler() throws Exception {
        return new AmazonCrawler();
    }

    @Override
    public String getProductTitle() throws Exception {
        return getStringValue(SYSTEM_PROPERTY_KEY_PRODUCT_TITLE_NODE);
    }

    @Override
    public String getProductCategory() throws Exception {
        String category = getStringValue(SYSTEM_PROPERTY_KEY_CATEGORY_NODE);
        if (!StringUtils.isEmpty(category) && category.contains(":")) {
            Map<String, CategoryEntity> categoriesDataConfigMap = getCategoriesDataConfig();
            Iterator<Entry<String, CategoryEntity>> iterator = categoriesDataConfigMap.entrySet().iterator();
            Entry<String, CategoryEntity> entry = null;
            CategoryEntity categoryEntity = null;
            List<String> tags = null;

            if (category.lastIndexOf(":") + 1 < category.length()) {
                category = category.substring(category.lastIndexOf(":") + 1).trim();
                while (iterator.hasNext()) {
                    entry = iterator.next();
                    categoryEntity = entry.getValue();
                    tags = categoryEntity.getCategoryTags();
                    for (String tag : tags) {
                        if (tag.equalsIgnoreCase(category)) {
                            return entry.getKey();
                        }
                    }
                }
            } else {
                category = category.substring(0, category.lastIndexOf(":"));
                while (iterator.hasNext()) {
                    entry = iterator.next();
                    categoryEntity = entry.getValue();
                    tags = categoryEntity.getCategoryTags();
                    for (String tag : tags) {
                        if (category.toUpperCase().contains(tag.toUpperCase())) {
                            return entry.getKey();
                        }
                    }
                }
            }
        }
        return null;
    }

    @Override
    public String getCurrency() throws Exception {
        String productCost = getStringValue(SYSTEM_PROPERTY_KEY_PRODUCT_COST_NODE);
        if (!StringUtils.isEmpty(productCost) &&
            productCost.contains(AppConstants.CURRENCY_SYMBOL_DOLLAR_SIGN)) {
            return AppConstants.CURRENCY_SYMBOL_DOLLAR_SIGN;
        }
        return super.getCurrency();
    }

    @Override
    public Double getProductCost() throws Exception {
        String productCost = getStringValue(SYSTEM_PROPERTY_KEY_PRODUCT_COST_NODE);
        if (!StringUtils.isEmpty(productCost) && !productCost.contains("-")) {
            return Double.parseDouble(CommonUtils.getNumericValueFromPlainText(productCost));
        } else if (!StringUtils.isEmpty(productCost)) {
            StringTokenizer st = new StringTokenizer(productCost, "-");
            List<Double> productCosts = new ArrayList<Double>();
            Double cost = null;
            while (st.hasMoreTokens()) {
                try {
                    cost = Double.parseDouble(CommonUtils.getNumericValueFromPlainText(st.nextToken()));
                    productCosts.add(cost);
                } catch (NumberFormatException nfe) {
                    LOG.error(nfe);
                }
            }
            double result = 0;
            for (Double value : productCosts) {
                result += value;
            }
            return result > 0 && productCosts.size() > 0 ? result / productCosts.size() : null;
        }
        return null;
    }

    @Override
    public Double getProductTaxAndShippingFee() throws Exception {
        String productTaxAndShippingFee = getStringValue(SYSTEM_PROPERTY_KEY_PRODUCT_TAX_AND_SHIPPING_COST_NODE);
        if (!StringUtils.isEmpty(productTaxAndShippingFee) && productTaxAndShippingFee.contains("on orders over")) {
            return null;
        }
        return getDoubleValue(SYSTEM_PROPERTY_KEY_PRODUCT_TAX_AND_SHIPPING_COST_NODE);
    }

    @Override
    public Double getProductImportTax() throws Exception {
        Map<String, CategoryEntity> categoriesDataConfigMap = getCategoriesDataConfig();
        Iterator<Entry<String, CategoryEntity>> iterator = categoriesDataConfigMap.entrySet().iterator();
        Entry<String, CategoryEntity> entry = null;
        CategoryEntity categoryEntity = null;
        String category = getProductCategory();
        while (iterator.hasNext()) {
            entry = iterator.next();
            categoryEntity = entry.getValue();
            if (entry.getKey().equals(category)) {
                return getProductCost() * categoryEntity.getCategoryImportTaxRate() / 100;
            }
        }
        return null;
    }

    @Override
    public Double getProductWeight() throws Exception {
        return getDoubleValue(SYSTEM_PROPERTY_KEY_PRODUCT_WEIGHT_NODE);
    }

    @Override
    public String getWeightUnit() throws Exception {
        String weightUnit = getStringValue(SYSTEM_PROPERTY_KEY_PRODUCT_WEIGHT_NODE);
        if (!StringUtils.isEmpty(weightUnit) &&
            weightUnit.toUpperCase().contains(AppConstants.WEIGHT_UNIT_POUNDS.toUpperCase())) {
            return AppConstants.WEIGHT_UNIT_POUNDS;
        }
        return super.getWeightUnit();
    }

    @Override
    public Double getProductShippingCost() throws Exception {
        Map<String, CategoryEntity> categoriesDataConfigMap = getCategoriesDataConfig();
        Iterator<Entry<String, CategoryEntity>> iterator = categoriesDataConfigMap.entrySet().iterator();
        Entry<String, CategoryEntity> entry = null;
        CategoryEntity categoryEntity = null;
        String category = getProductCategory();
        Double shippingCost = null;
        String shippingCostCurrency = null;
        String shippingUnit = null;
        while (iterator.hasNext()) {
            entry = iterator.next();
            categoryEntity = entry.getValue();
            if (entry.getKey().equals(category)) {
                shippingCost = categoryEntity.getCategoryShippingCost();
                shippingCostCurrency = categoryEntity.getCategoryShippingCostCurrency();
                shippingUnit = categoryEntity.getCategoryShippingUnit();
                if ("item".equalsIgnoreCase(shippingUnit) && getCurrency().equals(shippingCostCurrency)) {
                    return shippingCost;
                } else {
                    if (shippingUnit.equalsIgnoreCase(getWeightUnit()) && getCurrency().equals(shippingCostCurrency)) {
                        return shippingCost * getProductWeight();
                    } else if (getCurrency().equals(shippingCostCurrency)) {
                        return shippingCost * convertWeight(getWeightUnit(), shippingUnit, getProductWeight());
                    }
                }
            }
        }
        return null;
    }

    @Override
    public List<String> getProductImages() throws Exception {
        List<String> images = new ArrayList<String>();
        String productImage = getStringValue(SYSTEM_PROPERTY_KEY_PRODUCT_IMAGE);
        images.add(productImage);
        return images;
    }

}
