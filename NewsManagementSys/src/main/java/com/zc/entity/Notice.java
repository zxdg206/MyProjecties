package com.zc.entity;

import com.zc.utils.DateUtils;

import java.io.Serializable;
import java.util.Date;

public class Notice implements Serializable {
    private int oid;
    private String otitle;
    private String ocontent;
    private Date otime;
    private String odate;

    private String search;

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOtitle() {
        return otitle;
    }

    public void setOtitle(String otitle) {
        this.otitle = otitle;
    }

    public String getOcontent() {
        return ocontent;
    }

    public void setOcontent(String ocontent) {
        this.ocontent = ocontent;
    }

    public Date getOtime() {
        return otime;
    }

    public void setOtime(Date otime) {
        this.otime = otime;
    }

    public String getOdate() {
        return DateUtils.dateToString(otime);
    }

    public void setOdate(String odate) {
        this.odate = odate;
    }
}
