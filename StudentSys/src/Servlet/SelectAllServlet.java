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

@WebServlet("/SelectAllServlet")
public class SelectAllServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用逻辑层的查询所有学生方法，返回的是一个集合
        ServiceImpl service = new ServiceImpl();
        List<Student> students = service.selectAll();
//        for (Student stu:students) {
//            System.out.println(stu.toString());
//        }
        //将集合封装到request域中，封装前一定注意编码，再转发到前端jsp页面，前端页面由jstl获取值
        request.setCharacterEncoding("utf-8");
        request.setAttribute("students",students);
        request.getRequestDispatcher("showUsers.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
