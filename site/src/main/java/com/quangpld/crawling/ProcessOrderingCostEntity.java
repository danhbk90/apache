package com.quangpld.crawling;

public class ProcessOrderingCostEntity {

    private Double costValueConfig;
    private String currency;
    private Double processOrderingRate;

    public Double getCostValueConfig() {
        return costValueConfig;
    }
    public void setCostValueConfig(Double costValueConfig) {
        this.costValueConfig = costValueConfig;
    }
    public String getCurrency() {
        return currency;
    }
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    public Double getProcessOrderingRate() {
        return processOrderingRate;
    }
    public void setProcessOrderingRate(Double processOrderingRate) {
        this.processOrderingRate = processOrderingRate;
    }
}
