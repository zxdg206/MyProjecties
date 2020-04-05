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

/**
 * 封装修改的对象信息，跳转修改页面
 */
@WebServlet("/PackageServlet")
public class PackageServlet extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=utf-8");
            request.setCharacterEncoding("utf-8");
            //封装用户信息,转发给修改信息页面modify.jsp,以达到回显示信息的效果。
            String sno = request.getParameter("sno");
            List student = new ServiceImpl().findStudentByColumn("sno",sno);
            request.setAttribute("student",student.get(0));
            request.getRequestDispatcher("/modify.jsp").forward(request,response);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            this.doPost(req, resp);
        }
}
