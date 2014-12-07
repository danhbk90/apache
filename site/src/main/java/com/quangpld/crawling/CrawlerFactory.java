package com.quangpld.crawling;

import java.util.HashMap;
import java.util.Map;

public class CrawlerFactory {

  private static CrawlerFactory instance;
  private static Map<String, Crawler> crawlers = new HashMap<String, Crawler>();

  public static CrawlerFactory instance() {
    if (instance == null) {
      instance = new CrawlerFactory();
    }
    return instance;
  }

  public static void registerProduct(String crawlerId, Crawler crawler) {
    crawlers.put(crawlerId, crawler);
  }

  public Crawler createCrawler(String crawlerId) throws Exception {
    return crawlers.get(crawlerId).createCrawler();
  }

}
