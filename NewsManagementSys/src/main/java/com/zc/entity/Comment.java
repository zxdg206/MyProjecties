package com.zc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zc.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 如果不继承此接口无法正确返回JSon数据
 */
public class Comment implements Serializable {
    private int cid;
    private int nid;
    private String comment;
    private String uname;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
    private Date ctime;
    private String cdate;
    private String uprofile;

    private int curpage;

    public int getCurpage() {
        return curpage;
    }

    public void setCurpage(int curpage) {
        this.curpage = curpage;
    }

    public String getCdate() {
        return DateUtils.dateToString(this.ctime);
    }

    public void setCdate(String cdate) {
        this.cdate = cdate;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cid=" + cid +
                ", nid=" + nid +
                ", comment='" + comment + '\'' +
                ", uname='" + uname + '\'' +
                ", ctime=" + ctime +
                ", uprofile='" + uprofile + '\'' +
                '}';
    }

    public String getUprofile() {
        return uprofile;
    }

    public void setUprofile(String uprofile) {
        this.uprofile = uprofile;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }
}
