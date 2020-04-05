package Servlet;

import JavaBean.Student;
import Service.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/OrderByServlet")
public class OrderByServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //首先对cookie进行判断，确定是第几次执行
        //应该先封装，当前页面的记录再进行排序（待完善）
        List<Student> students = new ServiceImpl().orderByColumn(request.getParameter("col"));
        request.setCharacterEncoding("utf-8");
        request.setAttribute("students",students);

        request.getRequestDispatcher("/PagingServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
