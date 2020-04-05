package com.zc.dao;

import com.zc.domain.Book;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BookDao {

    /**
     * 查询所有书籍
     * @return
     */
    @Select("select * from web.book")
    List<Book> findAllBook();

    //根据书名查看书籍,基于模糊查询
    @Select("select * from web.book where bookname like #{bookname}")
    List<Book> findBookByname(String bookname);

    //根据id查询书籍
    @Select("select * from book where bookid =#{bookid}")
    Book findBookByBookId(int id);

    //插入书籍
//    insert into reader(readername,password,readerdept)values(#{readername},#{password},#{readerdept})
    @Insert("insert into book(bookname,bookauthor,bookpress,bookposition,bookdescibe,bookstate,bookpublish)values(#{bookname},#{bookauthor},#{bookpress},#{bookposition},#{bookdescibe},#{bookstate},#{bookpublish})")
    void insertBook(Book book);

    //删除书籍
//    delete from borrow where readerid=#{readerid} and bookid=#{bookid}
    @Delete("delete from book where bookid=#{bookid}")
    void deleBookById(int id);

    //根据书号更新书籍信息
//    update reader set readername=#{readername},password=#{password},readerdept=#{readerdept} where readerid=#{readerid}
    @Update("update book set bookname=#{bookname},bookauthor=#{bookauthor},bookpress=#{bookpress},bookposition=#{bookposition},bookdescibe=#{bookdescibe},bookstate=#{bookstate},bookpublish=#{bookpublish} where bookid=#{bookid}")
    void updateBook(Book book);
}
