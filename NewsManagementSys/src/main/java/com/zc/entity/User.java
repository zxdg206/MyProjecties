package com.zc.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private int uid;
    private String uname;
    private String upassword;
    private String uprofile;
    private String usex;
    private String uemail;
    private String uphone;
    private String uidentity;
    //前端取到的日期的自动格式化
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
    private Date ulastlogintime;
    //查询和分页数据
    private String uinfo;
    private int curpage;
    private int pagesize;

    public User() {
    }

    public User(int curpage, int pagesize) {
        this.curpage = curpage;
        this.pagesize = pagesize;
    }

    public int getCurpage() {
        return curpage;
    }

    public void setCurpage(int curpage) {
        this.curpage = curpage;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public String getUinfo() {
        if(uinfo==null){
            return null;
        }
        return "%"+uinfo+"%";
    }

    public void setUinfo(String uinfo) {
        this.uinfo = uinfo;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                ", uprofile='" + uprofile + '\'' +
                ", usex=" + usex +
                ", uemail='" + uemail + '\'' +
                ", uphone='" + uphone + '\'' +
                ", uidentity=" + uidentity +
                ", lastlogintime='" + ulastlogintime + '\'' +
                '}';
    }


    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public String getUidentity() {
        return uidentity;
    }

    public void setUidentity(String uidentity) {
        this.uidentity = uidentity;
    }

    public Date getUlastlogintime() {
        return ulastlogintime;
    }

    public void setUlastlogintime(Date ulastlogintime) {
        this.ulastlogintime = ulastlogintime;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }


    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getUprofile() {
        return uprofile;
    }

    public void setUprofile(String uprofile) {
        this.uprofile = uprofile;
    }
}
