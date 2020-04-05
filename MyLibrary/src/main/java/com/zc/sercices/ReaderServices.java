package com.zc.sercices;

import com.zc.dao.BookDao;
import com.zc.dao.BorrowDao;
import com.zc.dao.ReaderDao;
import com.zc.domain.Book;
import com.zc.domain.Borrow;
import com.zc.domain.Reader;
import com.zc.domain.ReaderBorrow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

/**
 * Date: 2019/7/2
 * Time: 9:10
 * Description：用户服务层
 */

@Service("readerService")
public class ReaderServices {

    @Autowired
    private ReaderDao readerDao;
    @Autowired
    private BookDao bookDao;
    @Autowired
    private BorrowDao borrowDao;

    //用户登录
    public boolean readerLogin(String id, String password){
        if(id == null || password == null){
            return false;
        }
        String realPassword = readerDao.findReaderById(Integer.parseInt(id)).getPassword();
        if(realPassword.equals(password)){
            return true;
        }
        return false;
    }
    //用户注册
    public void readerRegister(Reader reader){
        readerDao.addReader(reader);
    }

    //用户查询所有图书
    public List<Book> readFindAllBook(){
        return bookDao.findAllBook();
    }

    //用户根据id查询一本书
    public Book readFindBookByBookId(int id){
        return bookDao.findBookByBookId(id);
    }

    //用户借书
    public boolean readerBorrowBook(Reader reader, Book book){
        if(!book.isBookstate()){
            return false;
        }
        book.setBookstate(false);
        bookDao.updateBook(book);
        Borrow borrow = new Borrow();
        borrow.setReaderid(reader.getReaderid());
        borrow.setBookid(book.getBookid());
        borrow.setBorrowdate(new Date(new java.util.Date().getTime()));
        borrowDao.insertBorrow(borrow);
        return true;
    }

    //用户还书
    public void readerReturnBook(Reader reader, Book book){
        borrowDao.delBorrow(reader.getReaderid(), book.getBookid());
        book.setBookstate(true);
        bookDao.updateBook(book);
    }

//         * 根据id查询用户对应的对象
    public Reader findReaderById(int id){
        return readerDao.findReaderById(id);
    }

    //查看一个用户借书情况
    public List<ReaderBorrow> getReaderBorrowBooksById(int id){
        return borrowDao.getReaderBorrowByReader(id);
    }

    public List<Integer> findReaderBrrowBookid(int readerid){
        List<Integer> readerBrrowBookid = readerDao.findReaderBrrowBookid(readerid);
        return readerBrrowBookid;
    }
}
