package com.zc.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    //日期转化为固定格式
    public static String dateToString(Date date){
        return dateToString(date,"yyyy-MM-dd HH:mm");
    }
    public static String dateToString(Date date,String patterrn){
        if(date==null){
            return null;
        }
        return new SimpleDateFormat(patterrn).format(date);
    }
    //反之
    public static Date stringToDate(String date){
        SimpleDateFormat sdf = new SimpleDateFormat();
        Date parse;
        try {
            parse = sdf.parse(date);
            return parse;
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("转换失败");
        }
        return null;
    }
}
