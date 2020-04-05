package com.zc.contoll;

import org.springframework.core.convert.converter.Converter;


public class StringToBooleanConvert implements Converter<String, Boolean> {

    @Override
    public Boolean convert(String s) {
        if(s.equals("")){
            throw new RuntimeException("数据不能为空");
        }
        if(s.equals("true")){
            return true;
        }
        if(s.equals("false")){
            return false;
        }
        throw new RuntimeException("数据有误");
    }
}
