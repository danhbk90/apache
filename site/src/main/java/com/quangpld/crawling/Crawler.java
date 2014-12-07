package com.quangpld.crawling;

import java.util.List;

public interface Crawler {

    Crawler createCrawler() throws Exception;
    void setProductUrl(String productUrl) throws Exception;
    String getProductTitle() throws Exception;
    String getProductCategory() throws Exception;
    String getCurrency() throws Exception;
    Double getProductCost() throws Exception;
    Double getProductTaxAndShippingFee() throws Exception;
    Double getProductImportTax() throws Exception;
    Double getProductWeight() throws Exception;
    String getWeightUnit() throws Exception;
    Double getProductShippingCost() throws Exception;
    List<Double> getProcessOrderingCosts() throws Exception;
    List<String> getProductImages() throws Exception;
    List<Double> getPrepaidValues() throws Exception;
    Double getCategoryProductMinShippingCost() throws Exception;

}
