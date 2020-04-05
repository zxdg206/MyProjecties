package com.zc.domain;

import org.springframework.stereotype.Component;


@Component
public class Book {
    private Integer bookid;
    private String bookname;
    private String bookauthor;
    private String bookpress;
    private String bookposition;
    private String bookdescibe;
    private boolean bookstate;
    private String bookpublish;

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getBookauthor() {
        return bookauthor;
    }

    public void setBookauthor(String bookauthor) {
        this.bookauthor = bookauthor;
    }

    public String getBookpress() {
        return bookpress;
    }

    public void setBookpress(String bookpress) {
        this.bookpress = bookpress;
    }

    public String getBookposition() {
        return bookposition;
    }

    public void setBookposition(String bookposition) {
        this.bookposition = bookposition;
    }

    public String getBookdescibe() {
        return bookdescibe;
    }

    public void setBookdescibe(String bookdescibe) {
        this.bookdescibe = bookdescibe;
    }

    public boolean isBookstate() {
        return bookstate;
    }

    public void setBookstate(boolean bookstate) {
        this.bookstate = bookstate;
    }

    public String getBookpublish() {
        return bookpublish;
    }

    public void setBookpublish(String bookpublish) {
        this.bookpublish = bookpublish;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", bookauthor='" + bookauthor + '\'' +
                ", bookpress='" + bookpress + '\'' +
                ", bookposition='" + bookposition + '\'' +
                ", bookdescibe='" + bookdescibe + '\'' +
                ", bookstate=" + bookstate +
                ", bookpublish='" + bookpublish + '\'' +
                '}';
    }
}
