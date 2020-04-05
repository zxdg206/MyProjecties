package com.zc.contoll;

import com.zc.domain.Book;
import com.zc.domain.Borrow;
import com.zc.domain.Reader;
import com.zc.domain.ReaderBorrow;
import com.zc.sercices.BookServices;
import com.zc.sercices.BorrowServices;
import com.zc.sercices.ReaderServices;
import com.zc.sercices.UtilServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;



@Controller
@RequestMapping("/reader")
@SessionAttributes("reader")
public class ReaderCont {

    @Autowired
    ReaderServices readerService;

    @Autowired
    BookServices bookServices;

    @Autowired
    BorrowServices borrowServices;

    @Autowired
    UtilServices utilServices;


    
//    用户登录
    @RequestMapping("/login")
    public String readerLogin(String id, String password,Model model){
        if (id.equals("") || password.equals("")){
            return "failed";
        }
        boolean flag = readerService.readerLogin(id, password);
        if (flag){
            Reader reader = readerService.findReaderById(Integer.parseInt(id));
            //把用户的登录数据存入model中
            model.addAttribute("reader",reader);
            //将图书的信息存入Model对象
            model.addAttribute("bookList", readerService.readFindAllBook());
            return "allBooks";
        }else {
            return "failed";
        }
    }

    //用户注册
    @RequestMapping("/register")
    public void register(String readername, String password, String readerdept, HttpServletResponse response) throws IOException {
        if(readername.equals("") || password.equals("") || readerdept.equals("")){
            response.setHeader("refresh", "5;url='/readerlogin.jsp'");
            response.setContentType("text/html;charset=GB2312");
            response.getWriter().write("注册失败 将在5秒后跳转，如果没有，请点<a href='http://localhost:8080/readerlogin.jsp'>点击此处跳转</a>");
        }else {
            Reader reader = new Reader();
            reader.setPassword(password);
            reader.setReaderdept(readerdept);
            reader.setReadername(readername);
            readerService.readerRegister(reader);
            int temp = utilServices.getReaderMaxId();
            response.setHeader("refresh", "5;url='/readerlogin.jsp'");
            response.setContentType("text/html;charset=GB2312");
            response.getWriter().write("注册成功，你的id账号为------      " + temp + "    ------将在5秒后跳转，如果没有，请点<a href='http://localhost:8080/readerlogin.jsp'>点击此处跳转</a>");
        }
    }

    //用户借书
    @RequestMapping("/borrowbook")
    public String readerBorrowOneBooe(String bookid, ModelMap modelMap){
        if(bookid.equals("")){
            return "failed";
        }
        for(int i = 0; i < bookid.length(); i++){
            if (bookid.charAt(i) < 48  || bookid.charAt(i) > 57){
                return "failed";
            }
        }
        Reader reader = (Reader) modelMap.get("reader");
        Book book = readerService.readFindBookByBookId(Integer.parseInt(bookid));
        boolean flag = readerService.readerBorrowBook(reader, book);
        if (flag) {
            return "success";
        }
        return "failed";
    }

    //用户搜索书籍
    @RequestMapping("/serach")
    public String readerSerachBookByname(String bookname, Model model){
        String temp = "%"+bookname+"%";
        List<Book> searchBookList = bookServices.findBookByname(temp);
        if (searchBookList.isEmpty()){
            return "failed";
        }
        model.addAttribute("serachBookList",searchBookList);
        return "searchBook";
    }

    //用户查询自己的借阅信息
    @RequestMapping("/myBorrow")
    public String findMyBorrowInformation(ModelMap modelMap, Model model){
        Reader reader = (Reader) modelMap.get("reader");
        List<ReaderBorrow> myBorrowList = borrowServices.getReaderBorrowByReader(reader.getReaderid());
        if (myBorrowList.isEmpty()){
            return "tishi1";
        }
        model.addAttribute("myBorrowList", myBorrowList);
        return "myBorrowList";
    }

    //用户还书
    @RequestMapping("/returnBook")
    public String returnOneBook(String bookid, ModelMap modelMap){
        if(bookid.equals("")){
            return "failed";
        }
        for(int i = 0; i < bookid.length(); i++){
            if (bookid.charAt(i) < 48  || bookid.charAt(i) > 57){
                return "failed";
            }
        }
        Reader reader = (Reader) modelMap.get("reader");
        List<Integer> readerBrrowBookid = readerService.findReaderBrrowBookid(reader.getReaderid());
        if (readerBrrowBookid.contains(Integer.parseInt(bookid))){
            Book book = bookServices.findBookById(Integer.parseInt(bookid));
            readerService.readerReturnBook(reader,book);
            return "success";
        }
        return "failed";
    }

    //用户续借
    @RequestMapping("/reBorrow")
    public String readerReBorrow(String bookid, ModelMap modelMap){
        if(bookid.equals("")){
            return "failed";
        }
        for(int i = 0; i < bookid.length(); i++){
            if (bookid.charAt(i) < 48  || bookid.charAt(i) > 57){
                return "failed";
            }
        }
        Reader reader = (Reader) modelMap.get("reader");
        List<Integer> readerBrrowBookid = readerService.findReaderBrrowBookid(reader.getReaderid());
        if (readerBrrowBookid.contains(Integer.parseInt(bookid))){
            Borrow borrow = new Borrow();
            borrow.setReaderid(reader.getReaderid());
            borrow.setBookid(Integer.parseInt(bookid));
            borrow.setBorrowdate(new Date(new java.util.Date().getTime()));
            borrowServices.updateBorrow(borrow);
            return "success";
        }
        return "failed";
    }
}
