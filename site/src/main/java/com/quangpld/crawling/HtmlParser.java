package com.quangpld.crawling;

import java.io.IOException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.cyberneko.html.parsers.DOMParser;
import org.dom4j.Document;
import org.dom4j.io.DOMReader;

import com.quangpld.controller.crawling.CrawlingController;

public class HtmlParser {

    private static final Log LOG = LogFactory.getLog(CrawlingController.class);

    public static Document parse(String url) throws Exception {
        // TODO: This is a temporarily work-around processing.
        DOMParser parser = new DOMParser();
        for (int i = 0; i < 6; i++) {
            try {
                parser.parse(url);
                i += 6;
            } catch (IOException e) {
                LOG.error(e);
                if (i < 5) {
                    LOG.error("Parsing HTML error. Retry in " + (5000 * (i + 1)) + " seconds...");
                    Thread.sleep(5000 * (i + 1));
                }
            }
        }
    
        //
        org.w3c.dom.Document document = parser.getDocument();
        DOMReader domReader = new DOMReader();  
        return domReader.read(document);
    }

}
