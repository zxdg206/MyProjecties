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

@WebServlet("/checkedServlet")
public class checkedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收回显数据
        System.out.println("[checkedServlet]----------------------------------------------");
        String c_name = request.getParameter("c_name");
        String c_sno = request.getParameter("c_no");
        String c_sdept = request.getParameter("c_sdept");
        String cur_page = request.getParameter("cur_page");
        List list = new ArrayList();
        list.add(c_name);
        list.add(c_sno);
        list.add(c_sdept);
        //遍历所有从前端页面勾选的学号，依次调用services方法
        request.setCharacterEncoding("utf-8");
        String[] snos = request.getParameterValues("selectedSno");
        for(String sno:snos){
            new ServiceImpl().deleteBySno(sno);
        }
        System.out.println(list);
        request.setAttribute("query", list);//封装搜索记录,以集合返回
        System.out.println("Cur_Page="+cur_page);
        request.setAttribute("cur_page",cur_page);
        request.getRequestDispatcher("/PagingServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
