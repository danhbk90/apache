package com.quangpld.crawling;

import java.util.List;

public class CategoryEntity {

    private String categoryName;
    private List<String> categoryTags;
    private Double categoryImportTaxRate;
    private Double categoryShippingCost;
    private String categoryShippingCostCurrency;
    private String categoryShippingUnit;
    private Double categoryProductMinShippingCost;

    public String getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public List<String> getCategoryTags() {
        return categoryTags;
    }
    public void setCategoryTags(List<String> categoryTags) {
        this.categoryTags = categoryTags;
    }
    public Double getCategoryImportTaxRate() {
        return categoryImportTaxRate;
    }
    public void setCategoryImportTaxRate(Double categoryImportTaxRate) {
        this.categoryImportTaxRate = categoryImportTaxRate;
    }
    public Double getCategoryShippingCost() {
        return categoryShippingCost;
    }
    public void setCategoryShippingCost(Double categoryShippingCost) {
        this.categoryShippingCost = categoryShippingCost;
    }
    public String getCategoryShippingCostCurrency() {
        return categoryShippingCostCurrency;
    }
    public void setCategoryShippingCostCurrency(String categoryShippingCostCurrency) {
        this.categoryShippingCostCurrency = categoryShippingCostCurrency;
    }
    public String getCategoryShippingUnit() {
        return categoryShippingUnit;
    }
    public void setCategoryShippingUnit(String categoryShippingUnit) {
        this.categoryShippingUnit = categoryShippingUnit;
    }
    public Double getCategoryProductMinShippingCost() {
        return categoryProductMinShippingCost;
    }
    public void setCategoryProductMinShippingCost(Double categoryProductMinShippingCost) {
        this.categoryProductMinShippingCost = categoryProductMinShippingCost;
    }
}
