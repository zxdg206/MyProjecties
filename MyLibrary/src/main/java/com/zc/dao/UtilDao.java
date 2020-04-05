package com.zc.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


@Repository
public interface UtilDao {
    //统计书籍总数
    @Select("select count(bookid) from book")
    int getBookSum();

    //统计用户总数
    @Select("select count(readerid) from reader")
    int getReaderSum();

    //统计借出的书
    @Select("select count(borrowdate) from borrow")
    int getBorrowSum();

    //统计管理员数量
    @Select("select count(contorid) from contor")
    int getContorSum();

    //统计用户最大id
    @Select("select max(readerid) from reader")
    int getReaderMaxId();
}
