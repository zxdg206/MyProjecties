package com.zc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zc.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class RollNews implements Serializable {

    private int rid;
    private int nid;
    private String title;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
    private Date rtime;
    private String ndate;
    private String nimg;

    public String getNimg() {
        return nimg;
    }

    public void setNimg(String nimg) {
        this.nimg = nimg;
    }

    @Override
    public String toString() {
        return "RollNews{" +
                "rid=" + rid +
                ", nid=" + nid +
                ", title='" + title + '\'' +
                ", rtime=" + rtime +
                ", rdate='" + ndate + '\'' +
                '}';
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getRtime() {
        return rtime;
    }

    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public String getNdate() {
        return this.ndate = DateUtils.dateToString(this.rtime,"yyyy-MM-DD HH:mm");
    }

    public void setNdate(String ndate) {
        this.ndate = ndate;
    }
}
