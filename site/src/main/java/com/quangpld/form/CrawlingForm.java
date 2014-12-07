package com.quangpld.form;

import java.io.Serializable;

public class CrawlingForm implements Serializable {

    protected static final long serialVersionUID = 1L;

    protected String link;
    protected String redirectUrl;

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

}
