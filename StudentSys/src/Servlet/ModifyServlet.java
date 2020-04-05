package Servlet;

import JavaBean.Student;
import Service.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ModifyServlet")
public class ModifyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //封装用户要修改的信息
        String sno = request.getParameter("sno");
        String sname = request.getParameter("sname");
        String ssex = request.getParameter("ssex");
        int sage = Integer.parseInt(request.getParameter("sage"));
        String sdept = request.getParameter("sdept");
        String phone = request.getParameter("phone");
        Student stu = new Student(sno,sname,ssex,sage,sdept,phone);
        //调用方法完成业务转发
        boolean success = new ServiceImpl().updateStudent(stu);
        if(success){
            request.getRequestDispatcher("/PagingServlet").forward(request,response);
//            response.sendRedirect(request.getContextPath()+"/PagingServlet");
        }else {
            //更新失败
            response.sendRedirect(request.getContextPath()+"/ErrorPage");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
