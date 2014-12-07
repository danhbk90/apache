package com.quangpld.form;

import java.io.Serializable;
import java.util.List;

public class RequestBillForm implements Serializable {

    protected static final long serialVersionUID = 1L;

    protected String hostname;
    protected String fullname;
    protected String address;
    protected String email;
    protected String phone;
    protected String productLink;
    protected String productName;
    protected String productExtraInformation;
    protected String currency;
    protected String exchangeRate;
    protected Double webPrice;
    protected Double importTax;
    protected Double shippingAndTaxInternationalCost;
    protected Double shippingCost;
    protected Double shippingInternalCost;
    protected List<String> productImages;
    protected List<Double> orderingCosts;
    protected List<Double> finalCosts;
    protected List<Double> finalCostsVND;
    protected List<Double> prePaids;
    protected List<Double> prePaidsVND;
    protected List<Double> remainingCosts;

    public String getHostname() {
        return hostname;
    }
    public void setHostname(String hostname) {
        this.hostname = hostname;
    }
    public String getFullname() {
        return fullname;
    }
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getProductLink() {
        return productLink;
    }
    public void setProductLink(String productLink) {
        this.productLink = productLink;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public String getProductExtraInformation() {
        return productExtraInformation;
    }
    public void setProductExtraInformation(String productExtraInformation) {
        this.productExtraInformation = productExtraInformation;
    }
    public String getCurrency() {
        return currency;
    }
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    public String getExchangeRate() {
        return exchangeRate;
    }
    public void setExchangeRate(String exchangeRate) {
        this.exchangeRate = exchangeRate;
    }
    public Double getWebPrice() {
        return webPrice;
    }
    public void setWebPrice(Double webPrice) {
        this.webPrice = webPrice;
    }
    public Double getImportTax() {
        return importTax;
    }
    public void setImportTax(Double importTax) {
        this.importTax = importTax;
    }
    public Double getShippingAndTaxInternationalCost() {
        return shippingAndTaxInternationalCost;
    }
    public void setShippingAndTaxInternationalCost(
            Double shippingAndTaxInternationalCost) {
        this.shippingAndTaxInternationalCost = shippingAndTaxInternationalCost;
    }
    public Double getShippingCost() {
        return shippingCost;
    }
    public void setShippingCost(Double shippingCost) {
        this.shippingCost = shippingCost;
    }
    public Double getShippingInternalCost() {
        return shippingInternalCost;
    }
    public void setShippingInternalCost(Double shippingInternalCost) {
        this.shippingInternalCost = shippingInternalCost;
    }
    public List<String> getProductImages() {
        return productImages;
    }
    public void setProductImages(List<String> productImages) {
        this.productImages = productImages;
    }
    public List<Double> getOrderingCosts() {
        return orderingCosts;
    }
    public void setOrderingCosts(List<Double> orderingCosts) {
        this.orderingCosts = orderingCosts;
    }
    public List<Double> getFinalCosts() {
        return finalCosts;
    }
    public void setFinalCosts(List<Double> finalCosts) {
        this.finalCosts = finalCosts;
    }
    public List<Double> getFinalCostsVND() {
        return finalCostsVND;
    }
    public void setFinalCostsVND(List<Double> finalCostsVND) {
        this.finalCostsVND = finalCostsVND;
    }
    public List<Double> getPrePaids() {
        return prePaids;
    }
    public void setPrePaids(List<Double> prePaids) {
        this.prePaids = prePaids;
    }
    public List<Double> getPrePaidsVND() {
        return prePaidsVND;
    }
    public void setPrePaidsVND(List<Double> prePaidsVND) {
        this.prePaidsVND = prePaidsVND;
    }
    public List<Double> getRemainingCosts() {
        return remainingCosts;
    }
    public void setRemainingCosts(List<Double> remainingCosts) {
        this.remainingCosts = remainingCosts;
    }

}
