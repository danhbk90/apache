package com.quangpld.processor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.common.util.BLCSystemProperty;
import org.thymeleaf.Arguments;
import org.thymeleaf.dom.Element;
import org.thymeleaf.processor.attr.AbstractTextChildModifierAttrProcessor;
import org.thymeleaf.standard.expression.Expression;
import org.thymeleaf.standard.expression.StandardExpressions;

import com.quangpld.utils.CommonUtils;

public class MyPriceTextDisplayProcessor extends AbstractTextChildModifierAttrProcessor {

    /** Log object . */
    private static final Log LOG = LogFactory.getLog(MyPriceTextDisplayProcessor.class);

    /**
     * Sets the name of this processor to be used in Thymeleaf template
     */
    public MyPriceTextDisplayProcessor() {
        super("price");
    }
    
    @Override
    public int getPrecedence() {
        return 1500;
    }

    @Override
    protected String getText(Arguments arguments, Element element, String attributeName) {
        
        Money price = null;

        Expression expression = (Expression) StandardExpressions.getExpressionParser(arguments.getConfiguration())
                .parseExpression(arguments.getConfiguration(), arguments, element.getAttributeValue(attributeName));
        Object result = expression.execute(arguments.getConfiguration(), arguments);
        if (result instanceof Money) {
            price = (Money) result;
        } else if (result instanceof Number) {
            price = new Money(((Number)result).doubleValue());
        }

        if (price == null) {
            return "Not Available";
        }

        Double exchangeRate = null;
        try {
            exchangeRate = Double.parseDouble(BLCSystemProperty.resolveSystemProperty("Crawling.ExchangeRateUSDVND"));
        } catch (NumberFormatException nfe) {
            LOG.error(nfe);
        }

        if (exchangeRate == null) {
            return "Not Available";
        }

        return CommonUtils.getDisplayCost(Double.valueOf(price.getAmount().toString()) * exchangeRate, false) + " \u20AB";
    }

}
