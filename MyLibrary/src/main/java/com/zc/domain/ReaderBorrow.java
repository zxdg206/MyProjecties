package com.zc.domain;

import org.springframework.stereotype.Component;

import java.sql.Date;


@Component
public class ReaderBorrow {
    private int readerid;
    private String readername;
    private int bookid;
    private String bookname;
    private Date borrowdate;

    public int getReaderid() {
        return readerid;
    }

    public void setReaderid(int readerid) {
        this.readerid = readerid;
    }

    public String getReadername() {
        return readername;
    }

    public void setReadername(String readername) {
        this.readername = readername;
    }

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

    public Date getBorrowdate() {
        return borrowdate;
    }

    public void setBorrowdate(Date borrowdate) {
        this.borrowdate = borrowdate;
    }

    @Override
    public String toString() {
        return "ReaderBorrow{" +
                "readerid=" + readerid +
                ", readername='" + readername + '\'' +
                ", bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", borrowdate=" + borrowdate +
                '}';
    }
}
