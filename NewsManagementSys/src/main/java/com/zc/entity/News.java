package com.zc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zc.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class News implements Serializable {


    public News() {
    }

    public News(int curpage, int pagesize) {
        this.curpage = curpage;
        this.pagesize = pagesize;
    }

    private int nid;
    private int comments;
    private int views;
    private int collections;
    private int likes;
    private String title;
    private String content;
    private String menu;
    private String type;
    private String tags;
    private String author;
    private String brief;
    private String nimg;
    private String nsrc;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
    private Date ntime;
    private String ndate;

    @Override
    public String toString() {
        return "News{" +
                "nid=" + nid +
                ", comments=" + comments +
                ", views=" + views +
                ", collections=" + collections +
                ", likes=" + likes +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", menu='" + menu + '\'' +
                ", type='" + type + '\'' +
                ", author='" + author + '\'' +
                ", brief='" + brief + '\'' +
                ", nimg='" + nimg + '\'' +
                ", nsrc='" + nsrc + '\'' +
                ", ntime=" + ntime +
                ", ndate='" + ndate + '\'' +
                ", topnews='" + topnews + '\'' +
                ", rollnews='" + rollnews + '\'' +
                ", search='" + search + '\'' +
                '}';
    }

    //分类
    private String topnews = "no";
    private String rollnews = "no";
    //分页
    int curpage;
    int pagesize;
    String search;

    public String getTopnews() {
        return topnews;
    }

    public void setTopnews(String topnews) {
        this.topnews = topnews;
    }

    public String getRollnews() {
        return rollnews;
    }

    public void setRollnews(String rollnews) {
        this.rollnews = rollnews;
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

    public String getSearch() {
        if (search==null){
            return null;
        }
        return '%'+search+'%';
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getNdate() {
        return DateUtils.dateToString(ntime);
    }

    public void setNdate(String ndate) {
        this.ndate = ndate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNimg() {
        return nimg;
    }

    public void setNimg(String nimg) {
        this.nimg = nimg;
    }

    public String getNsrc() {
        return nsrc;
    }

    public void setNsrc(String nsrc) {
        this.nsrc = nsrc;
    }

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public int getComments() {
        return comments;
    }

    public void setComments(int comments) {
        this.comments = comments;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public int getCollections() {
        return collections;
    }

    public void setCollections(int collections) {
        this.collections = collections;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }


    public Date getNtime() {
        return ntime;
    }

    public void setNtime(Date ntime) {
        this.ntime = ntime;
    }
}
