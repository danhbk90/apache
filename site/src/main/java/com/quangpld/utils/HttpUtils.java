package com.quangpld.utils;

import org.apache.http.HttpHost;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.HttpCoreContext;

public class HttpUtils {

    public static String getHostName(String url) throws Exception {
        CloseableHttpClient httpclient = HttpClientBuilder.create().build();
        HttpContext localContext = new BasicHttpContext();
        HttpGet httpget = new HttpGet(url); 
        httpclient.execute(httpget, localContext);
        HttpHost target = (HttpHost) localContext.getAttribute(HttpCoreContext.HTTP_TARGET_HOST);
        return target.getHostName();
      }

}
