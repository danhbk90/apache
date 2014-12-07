package com.quangpld.crawling;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CrawlingInitializationListener implements ServletContextListener {

  @Override
  public void contextDestroyed(ServletContextEvent arg0) {
  }

  @Override
  public void contextInitialized(ServletContextEvent arg0) {
    try {
      Class.forName("com.quangpld.crawling.AmazonCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.EbayCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.EbayMobileCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.WalmartCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.WalmartMobileCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.RaffaelloNetworkCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.NordstromCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.NordstromMobileCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.Forever21Crawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.MacysCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.MacysMobileCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.SephoraCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.SephoraMobileCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.BathAndBodyWorksCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.BathAndBodyWorksMobileCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.HeadDirectCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.WooAudioCrawler");
//      Class.forName("com.quangpld.ordering.system.core.crawling.impl.MoonAudioCrawler");
    } catch (ClassNotFoundException e) {
    }
  }

}
