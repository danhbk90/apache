package com.quangpld.utils;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class CommonUtils {

    public static String getNumericValueFromPlainText(String str) {
        if (str == null) {
            return null;
        }

        return str.replaceAll(AppConstants.REGULAR_EXPRESSION_CHARACTERS_OTHER_THAN_DIGIT_AND_DOT,
                              AppConstants.EMPTY_STRING);
    }

    public static String getDisplayCost(Double cost, boolean isKeptFraction) {
        DecimalFormat df = null;
        if (isKeptFraction) {
            df = new DecimalFormat("#,##0.00");
        } else {
            df = new DecimalFormat("#,##0");
        }

        if (cost != null) {
            return df.format(Math.abs(cost));
        } else {
            return df.format(new Double(0.0d));
        }
    }

    public static List<String> getDisplayCosts(List<Double> costs, boolean isKeptFraction) {
        List<String> displayCosts = new ArrayList<String>();
        if (costs != null && costs.size() > 0) {
            for (Double cost : costs) {
                displayCosts.add(getDisplayCost(cost, isKeptFraction));
            }
        }
        return displayCosts;
    }

}
