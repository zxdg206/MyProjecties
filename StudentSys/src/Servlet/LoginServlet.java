package Servlet;

import JavaBean.Manager;
import Service.ServiceImpl;
import Service.Services;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //验证验证码，只要不一致写入错误信息，然后return
        HttpSession session = request.getSession();
        String ser_code = (String)session.getAttribute("CHECKCODE_SERVER");
        if(!request.getParameter("verifycode").equalsIgnoreCase(ser_code)){//注意忽略大小写比较
            request.setAttribute("errormsg","验证码错误");
            try {
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
        //删除存在的验证码，目的是防止用户后退时，验证码被保留
        session.removeAttribute("CHECKCODE_SERVER");

        //将从前端提交的数据封装到Manager
        String mname = request.getParameter("mname");
        String password = request.getParameter("password");
        Manager manager = new Manager(mname,password);
        //数据封装后，用过调用业务逻辑层的方法将来达到控制转发的效果。
        Services ser = new ServiceImpl();
        boolean istrue =  ser.login(manager);

        if (istrue){
            //存在用户，登陆成功
            session.setAttribute("manager",manager);
            try {
                response.sendRedirect("index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            //不存在用户，登陆失败
            request.setAttribute("errormsg","用户名或密码错误");//将来单独验证用户名和密码
            try {
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        this.doPost(request, response);
    }
}
