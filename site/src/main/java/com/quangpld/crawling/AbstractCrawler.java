package com.quangpld.crawling;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.util.Map.Entry;

import org.broadleafcommerce.common.util.BLCSystemProperty;
import org.broadleafcommerce.common.web.BroadleafRequestContext;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonToken;
import org.dom4j.Document;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.springframework.util.StringUtils;

import com.quangpld.utils.AppConstants;
import com.quangpld.utils.CommonUtils;

public abstract class AbstractCrawler implements Crawler {

    public static final String DEFAULT_DELIMITER = ",";
    public static final String ENCODING_UTF_8 = "UTF-8";
    public static final String SYSTEM_PROPERTY_KEY_CRAWLING_DEBUG_FILE_PATH = "Crawling.DebugFilePath";

    protected String productUrl = null;
    protected Document document = null;

    @Override
    public void setProductUrl(String productUrl) throws Exception {
        this.productUrl = productUrl;
        document = HtmlParser.parse(productUrl);
        serializetoXML(getOutputStreamForDebugging(), ENCODING_UTF_8);
    }

    @Override
    public String getCurrency() throws Exception {
        return AppConstants.CURRENCY_SYMBOL_DOLLAR_SIGN;
    }

    @Override
    public String getWeightUnit() throws Exception {
        return AppConstants.WEIGHT_UNIT_POUNDS;
    }

    @Override
    public List<Double> getProcessOrderingCosts() throws Exception {
        List<Double> processOrderingCosts = new ArrayList<Double>();
        Double productCost = getProductCost();
        if (productCost != null && productCost > 0) {
            Map<Double, TreeMap<Double, ProcessOrderingCostEntity>> processOrderingCostDataConfig = getProcessOrderingCostDataConfig();
            Iterator<Double> iterator = processOrderingCostDataConfig.keySet().iterator();
            Iterator<Double> dataConfigIterator = null;
            ProcessOrderingCostEntity processOrderingCostEntity = null;
            while (iterator.hasNext()) {
                Map<Double, ProcessOrderingCostEntity> dataConfig = processOrderingCostDataConfig.get(iterator.next());
                dataConfigIterator = dataConfig.keySet().iterator();
                while (dataConfigIterator.hasNext()) {
                    processOrderingCostEntity = dataConfig.get(dataConfigIterator.next());
                    if (!dataConfigIterator.hasNext() || productCost < processOrderingCostEntity.getCostValueConfig()) {
                        processOrderingCosts.add(productCost * processOrderingCostEntity.getProcessOrderingRate() / 100);
                        break;
                    }
                }
            }
        }
        Collections.sort(processOrderingCosts);
        return processOrderingCosts;
    }

    @Override
    public List<Double> getPrepaidValues() throws Exception {
        List<Double> prepaidValues = new ArrayList<Double>();
        Map<Double, TreeMap<Double, ProcessOrderingCostEntity>> processOrderingCostDataConfig = getProcessOrderingCostDataConfig();
        Iterator<Double> iterator = processOrderingCostDataConfig.keySet().iterator();
        while (iterator.hasNext()) {
            prepaidValues.add(iterator.next());
        }
        Collections.sort(prepaidValues, Collections.reverseOrder());
        return prepaidValues;
    }

    @Override
    public Double getCategoryProductMinShippingCost() throws Exception {
        String category = getProductCategory();
        Map<String, CategoryEntity> categoriesDataConfigMap = getCategoriesDataConfig();
        Iterator<Entry<String, CategoryEntity>> iterator = categoriesDataConfigMap.entrySet().iterator();
        Entry<String, CategoryEntity> entry = null;
        CategoryEntity categoryEntity = null;
        while (iterator.hasNext()) {
            entry = iterator.next();
            categoryEntity = entry.getValue();
            if (categoryEntity.getCategoryName().equals(category)) {
                return categoryEntity.getCategoryProductMinShippingCost();
            }
        }
        return null;
    }

    protected String getStringValue(String keyNodes) throws Exception {
        Node node = getNode(keyNodes);
        if (node != null) {
            return node.getText();
        }
        return null;
    }

    protected Double getDoubleValue(String keyNodes) throws Exception {
        Node node = getNode(keyNodes);
        if (node != null) {
            String value = node.getText();
            try {
                return Double.parseDouble(CommonUtils.getNumericValueFromPlainText(value));
            } catch (NumberFormatException nfe) {
            }
        }
        return null;
    }

    protected void serializetoXML(OutputStream outputStream, String encoding) throws Exception {
        if (this.document != null && outputStream != null) {
            OutputFormat outputFormat = OutputFormat.createPrettyPrint();
            outputFormat.setEncoding(encoding);
            XMLWriter xmlWriter = new XMLWriter(outputStream, outputFormat);
            xmlWriter.write(this.document);
            xmlWriter.flush();
        }
    }

    protected OutputStream getOutputStreamForDebugging() throws Exception {
        String filePath = BLCSystemProperty.resolveSystemProperty(SYSTEM_PROPERTY_KEY_CRAWLING_DEBUG_FILE_PATH);
        if (StringUtils.isEmpty(filePath)) {
            return null;
        }

        File file = new File(filePath);
        if (!file.exists()) {
            file.createNewFile();
        }
        FileOutputStream fop = new FileOutputStream(file);
        return fop;
    }

    protected static Map<String, CategoryEntity> getCategoriesDataConfig() throws Exception {
        Map<String, CategoryEntity> maps = new HashMap<String, CategoryEntity>();
        BroadleafRequestContext broadleafRequestContext = BroadleafRequestContext.getBroadleafRequestContext();
        String categoriesDataConfig = broadleafRequestContext.getMessageSource().getMessage("crawling.categories.dataConfig", null,
                                                                                            broadleafRequestContext.getJavaLocale());
        JsonParser jsonParser = new JsonFactory().createJsonParser(categoriesDataConfig);
        String name = null;
        CategoryEntity category = null;
        String tags = null;
        String importTaxRate = null;
        String shippingCost = null;
        StringTokenizer st = null;
        List<String> tagList = null;
        while (jsonParser.nextToken() != JsonToken.END_OBJECT) {
            name = jsonParser.getCurrentName();
            if("categories".equals(name)) {
                jsonParser.nextToken();
                while (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                    name = jsonParser.getCurrentName();
                    if ("categoryName".equals(name)) {
                        jsonParser.nextToken();
                        category = new CategoryEntity();
                        category.setCategoryName(jsonParser.getText());
                        maps.put(jsonParser.getText(), category);
                    } else if ("categoryTags".equals(name)) {
                        jsonParser.nextToken();
                        tags = jsonParser.getText();
                        tagList = new ArrayList<String>();
                        st = new StringTokenizer(tags, DEFAULT_DELIMITER);
                        while (st.hasMoreTokens()) {
                            tagList.add(st.nextToken());
                        }
                        category.setCategoryTags(tagList);
                    } else if ("categoryImportTaxRate".equals(name)) {
                        jsonParser.nextToken();
                        importTaxRate = jsonParser.getText();
                        category.setCategoryImportTaxRate(Double.parseDouble(CommonUtils.getNumericValueFromPlainText(importTaxRate)));
                    } else if ("categoryShippingCost".equals(name)) {
                        jsonParser.nextToken();
                        shippingCost = jsonParser.getText();
                        category.setCategoryShippingCost(Double.parseDouble(CommonUtils.getNumericValueFromPlainText(shippingCost)));
                        category.setCategoryShippingCostCurrency(shippingCost.contains(AppConstants.CURRENCY_SYMBOL_DOLLAR_SIGN) ?
                                                                                       AppConstants.CURRENCY_SYMBOL_DOLLAR_SIGN : null);
                    } else if ("categoryShippingUnit".equals(name)) {
                        jsonParser.nextToken();
                        category.setCategoryShippingUnit(jsonParser.getText());
                    } else if ("categoryProductMinShippingCost".equals(name)) {
                        jsonParser.nextToken();
                        category.setCategoryProductMinShippingCost(Double.parseDouble(CommonUtils.getNumericValueFromPlainText(jsonParser.getText())));
                    }
                }
            }
        }
        return maps;
    }

    protected static Map<Double, TreeMap<Double, ProcessOrderingCostEntity>> getProcessOrderingCostDataConfig() throws Exception {
        Map<Double, TreeMap<Double, ProcessOrderingCostEntity>> maps = new HashMap<Double, TreeMap<Double,ProcessOrderingCostEntity>>();
        BroadleafRequestContext broadleafRequestContext = BroadleafRequestContext.getBroadleafRequestContext();
        String processOrderingDataConfig = broadleafRequestContext.getMessageSource().getMessage("crawling.processOrderingRate.dataConfig", null,
                                                                                                 broadleafRequestContext.getJavaLocale());
        JsonParser jsonParser = new JsonFactory().createJsonParser(processOrderingDataConfig);
        String name = null;
        TreeMap<Double, ProcessOrderingCostEntity> dataConfig = null;
        ProcessOrderingCostEntity processOrderingCostEntity = null;
        while (jsonParser.nextToken() != JsonToken.END_OBJECT) {
            name = jsonParser.getCurrentName();
            if("processOrderingRate".equals(name)) {
                jsonParser.nextToken();
                while (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                    name = jsonParser.getCurrentName();
                    if ("prePaidRate".equals(name)) {
                        jsonParser.nextToken();
                        dataConfig = new TreeMap<Double, ProcessOrderingCostEntity>();
                        maps.put(Double.parseDouble(CommonUtils.getNumericValueFromPlainText(jsonParser.getText())), dataConfig);
                    } else if ("dataConfig".equals(name)) {
                        jsonParser.nextToken();
                        while (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                            name = jsonParser.getCurrentName();
                            if ("costValue".equals(name)) {
                                jsonParser.nextToken();
                                processOrderingCostEntity = new ProcessOrderingCostEntity();
                                processOrderingCostEntity.setCostValueConfig(Double.parseDouble(CommonUtils.getNumericValueFromPlainText(jsonParser.getText())));
                                if (!StringUtils.isEmpty(jsonParser.getText()) &&
                                    jsonParser.getText().contains(AppConstants.CURRENCY_SYMBOL_DOLLAR_SIGN)) {
                                    processOrderingCostEntity.setCurrency(AppConstants.CURRENCY_SYMBOL_DOLLAR_SIGN);
                                }
                                dataConfig.put(processOrderingCostEntity.getCostValueConfig(), processOrderingCostEntity);
                            } else if ("processOrderingRate".equals(name)) {
                                jsonParser.nextToken();
                                processOrderingCostEntity.setProcessOrderingRate(Double.parseDouble(CommonUtils.getNumericValueFromPlainText(jsonParser.getText())));
                            }
                        }
                    }
                }
            }
        }
        return maps;
    }

    protected Double convertWeight(String fromUnit, String toUnit, Double weight) {
        if (fromUnit == null || toUnit == null || weight == null) {
            return null;
        }

        Double result = null;
        if ("pounds".equals(fromUnit) && "kg".equals(toUnit)) {
            result =  weight * 0.453592;
        }
        return result;
    }

    private Node getNode(String keyNodes) throws Exception {
        if (document != null) {
            String nodes = BLCSystemProperty.resolveSystemProperty(keyNodes);
            if (!StringUtils.isEmpty(nodes)) {
                StringTokenizer st = new StringTokenizer(nodes, DEFAULT_DELIMITER);
                Node node = null;
                while (st.hasMoreTokens()) {
                    node = document.selectSingleNode(st.nextToken());
                    if (node != null) {
                        return node;
                    }
                }
            }
        }
        return null;
    }

}
