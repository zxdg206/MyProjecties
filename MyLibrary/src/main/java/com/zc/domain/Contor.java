package com.zc.domain;

import org.springframework.stereotype.Component;



@Component
public class Contor {
    private Integer contorid;
    private String  contorname;
    private String password;

    public Integer getContorid() {
        return contorid;
    }

    public void setContorid(Integer contorid) {
        this.contorid = contorid;
    }

    public String getContorname() {
        return contorname;
    }

    public void setContorname(String contorname) {
        this.contorname = contorname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Contor{" +
                "contorid=" + contorid +
                ", contorname='" + contorname + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
