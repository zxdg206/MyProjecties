package com.zc.domain;

import org.springframework.stereotype.Component;

import java.sql.Date;


@Component
public class Borrow {
    private Integer readerid;
    private Integer bookid;
    private Date borrowdate;


    public Integer getReaderid() {
        return readerid;
    }

    public void setReaderid(Integer readerid) {
        this.readerid = readerid;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public Date getBorrowdate() {
        return borrowdate;
    }

    public void setBorrowdate(Date borrowdate) {
        this.borrowdate = borrowdate;
    }

    @Override
    public String toString() {
        return "Borrow{" +
                "readerid=" + readerid +
                ", bookid=" + bookid +
                ", borrowdate=" + borrowdate +
                '}';
    }
}
