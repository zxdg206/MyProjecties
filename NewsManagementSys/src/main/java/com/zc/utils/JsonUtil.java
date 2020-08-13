package com.zc.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import java.text.SimpleDateFormat;
import java.util.Date;

public class JsonUtil {
    public static String getJson(Object obj){
        return getJson(obj,"YYYY-MM-dd HH:mm:ss");
    }

    public static String getJson(Object obj,String datePattern){
        ObjectMapper mapper = new ObjectMapper();
        //关闭默认的时间戳显示方式
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS,false);
        SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
        mapper.setDateFormat(sdf);
        try {
            return mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
