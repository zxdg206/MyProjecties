package com.zc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zc.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class TopNews implements Serializable {
    {

    }
    private int tid;
    private int nid;
    private String title;
    @DateTimeFormat(pattern = "yyyy-MM-DD HH:mm")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
    private Date ttime;
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
                "rid=" + tid +
                ", nid=" + nid +
                ", title='" + title + '\'' +
                ", rtime=" + ttime +
                ", rdate='" + ndate + '\'' +
                '}';
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
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

    public Date getTtime() {
        return ttime;
    }

    public void setTtime(Date ttime) {
        this.ttime = ttime;
    }

    public String getNdate() {
        return DateUtils.dateToString(this.ttime,"yyyy-MM-dd HH:mm");
    }

    public void setNdate(String ndate) {
        this.ndate = ndate;
    }
}
