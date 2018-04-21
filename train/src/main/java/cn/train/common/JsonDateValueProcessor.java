package cn.train.common;

//Date日期类型以json形式显示到前台时，显示为[object Object]问题
//解决方法一： JSON 创建日期格式处理类 JsonDateValueProcessor
//JSON 日期格式处理（java转化为JSON）
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProcessor implements JsonValueProcessor {


    private String datePattern = "yyyy-MM-dd";

    //构造方法
    public JsonDateValueProcessor() {
        super();
    }
    public JsonDateValueProcessor(String format) {
        super();
        this.datePattern = format;
    }

    
    public Object processArrayValue(Object value, JsonConfig jsonConfig) {
        return process(value);
    }

    public Object processObjectValue(String key, Object value,
    		JsonConfig jsonConfig) {
    	return process(value);
    }

    private Object process(Object value) {
        try {
            if (value instanceof Date) {
                SimpleDateFormat sdf = new SimpleDateFormat(datePattern,
                        Locale.UK);
                return sdf.format((Date) value);
            }
            return value == null ? "" : value.toString();
        } catch (Exception e) {
            return "";
        }

    }

    public String getDatePattern() {
        return datePattern;
    }
    public void setDatePattern(String pDatePattern) {
        datePattern = pDatePattern;
    }

}
