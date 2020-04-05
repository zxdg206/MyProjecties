package com.zc.contoll;

import com.zc.domain.Book;
import com.zc.domain.Contor;
import com.zc.domain.LibraryInFoVo;
import com.zc.sercices.BookServices;
import com.zc.sercices.ContorServices;
import com.zc.sercices.UtilServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;



@Controller
@RequestMapping("/admin")
@SessionAttributes("admin")
public class AdminCont {

    @Autowired
    ContorServices contorServices;
    @Autowired
    BookServices bookServices;
    @Autowired
    UtilServices utilServices;

    //管理员登录
    @RequestMapping("/login")
    public String readerLogin(String adminid, String password, Model model){
        if (adminid.equals("") || password.equals("")){
            return "failed";
        }
        for(int i = 0; i < adminid.length(); i++){
            if (adminid.charAt(i) < 48  || adminid.charAt(i) > 57){
                return "failed";
            }
        }
        boolean flag = contorServices.login(Integer.parseInt(adminid),password);
        if (flag){
            Contor admin = contorServices.getContorById(Integer.parseInt(adminid));
            //把用户的登录数据存入model中
            model.addAttribute("admin",admin);
            //将图书的信息存入Model对象
            model.addAttribute("bookList", bookServices.findAllBook());

            LibraryInFoVo libraryInFoVo = utilServices.getLibraryInfo();
            //将图书馆信息存入model对象中
            model.addAttribute("libraryInFo", libraryInFoVo);
            return "adminBook";
        }else {
            return "failed";
        }
    }

    //管理严添加图书
    @RequestMapping("/addBook")
    public String addBook(Book book){
        bookServices.addBook(book);
        return "success";
    }

    //删除图书
    @RequestMapping("/delBook")
    public String  delBook(String bookid){
        if(bookid.equals("")){
            return "failed";
        }
        for(int i = 0; i < bookid.length(); i++){
            if (bookid.charAt(i) < 48  || bookid.charAt(i) > 57){
                return "failed";
            }
        }
        List<Book> bookList = bookServices.findAllBook();
        boolean flag = false;
        for(Book book : bookList){
            if (book.getBookid() == Integer.parseInt(bookid)){
                flag = true;
            }
        }
        if (flag){
            bookServices.delBook(Integer.parseInt(bookid));
            return "success";
        }
        return "failed";
    }

    //管理员添加管理员
    @RequestMapping("/addAdmin")
    public String addAdmin(Contor contor){
        contorServices.addContor(contor);
        return "success";
    }
}