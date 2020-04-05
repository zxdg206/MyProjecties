package com.zcs.dao;

import com.zc.domain.Borrow;
import com.zc.domain.ReaderBorrow;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BorrowDao {

    //查询所有借阅信息
    @Select("select * from web.borrow")
    List<Borrow> getAllBorrow();

    //根据用户查询借阅信息（个人借阅信息）
//    select reader.readername, book.bookname, borrow.borrowdate from reader, book, borrow where reader.readerid = borrow.readerid and borrow.bookid = book.bookid
//    @Select("select reader.readerid, reader.readername, book.bookid,book.bookname, borrow.borrowdate from reader, book, borrow where reader.readerid=#{readerid} and borrow.bookid = book.bookid")
    @Select("select borrow.bookid,book.bookname, reader.readerid,reader.readername,borrow.borrowdate from reader, book, borrow where borrow.readerid=#{readerid} and borrow.bookid = book.bookid and reader.readerid = borrow.readerid")
    List<ReaderBorrow> getReaderBorrowByReader(int readerid);

    //插入借阅一条借阅记录
    //insert into user(username,password,userdept)values(#{username},#{password},#{userdept})
    @Insert("insert into borrow(readerid,bookid,borrowdate)values(#{readerid},#{bookid},#{borrowdate})")
    void insertBorrow(Borrow borrow);

    //修改借阅信息
//    update user set username=#{username},password=#{password},userdept=#{userdept} where userid=#{userid}
    @Update("update borrow set readerid=#{readerid},bookid=#{bookid},borrowdate=#{borrowdate} where readerid=#{readerid} and bookid=#{bookid}")
    void updateBorrow(Borrow borrow);

    //根据用户id和书id确定一条借阅记录
    @Select("select * from borrow where readerid=#{readerid} and bookid=#{bookid}")
    Borrow getBorrowByReaderidBookid(@Param("readerid") int readerid, @Param("bookid") int bookid);

    //删除一条借阅记录
    @Delete("delete from borrow where readerid=#{readerid} and bookid=#{bookid}")
    void delBorrow(@Param("readerid") int readerid, @Param("bookid") int bookid);
}
