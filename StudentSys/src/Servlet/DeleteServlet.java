package Servlet;

import Service.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取数据
        String sno = request.getParameter("dsno");
        //调用方法
        boolean flag = new ServiceImpl().deleteBySno(sno);
        //判断删除是否成功
        if(flag){
            String cur_page = request.getParameter("cur_page");
            request.setAttribute("cur_page",cur_page);
            request.getRequestDispatcher("/PagingServlet").forward(request,response);
        }else {
            //删除失败（待完善）
            response.sendRedirect(request.getContextPath()+"/ErrorPage.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
