package com.zc.sercices;

import com.zc.dao.BookDao;
import com.zc.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Date: 2019/7/2
 * Time: 13:30
 * Description：书籍的服务层
 */
@Service
public class BookServices {
    @Autowired
    private BookDao bookDao;

//    查询所有书籍
    public List<Book> findAllBook(){
        return bookDao.findAllBook();
    }

    //根据书名查看书籍,基于模糊查询
    public List<Book> findBookByname(String bookname){
        return bookDao.findBookByname(bookname);
    }

    //根据id查询书籍
    public Book findBookById(int id){
        return bookDao.findBookByBookId(id);
    }

    //插入书籍
    public void addBook(Book book){
        bookDao.insertBook(book);
    }

    //删除书籍
    public void delBook(int id){
        bookDao.deleBookById(id);
    }

    //根据书号更新书籍信息
    public void update(Book book){
        bookDao.updateBook(book);
    }

}
