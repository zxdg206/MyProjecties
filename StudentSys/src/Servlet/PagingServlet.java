package Servlet;

import JavaBean.PageBean;
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
 * * 要想在前端显示数据，需要传入当前页码值(显示)只需要当前页码值和一个查询数据的集合
 */

@WebServlet("/PagingServlet")
public class PagingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int cur_page;
        String CUR_PAGE = request.getParameter("cur_page");
        boolean flag = true;//用于判断curpage是否正常,ture为正常传入的页码。

        //先对为空的情况赋值；
        if (CUR_PAGE == null || "".equals(CUR_PAGE)) {
            flag = false;
        } else {
            //若不为空则过滤非法输入
            for (int i = 0; i < CUR_PAGE.length(); i++) {
                if (CUR_PAGE.charAt(i) > '9' || CUR_PAGE.charAt(i) < '1') {
                    flag = false;
                    break;
                }
            }
        }

        if (flag) {
            cur_page = Integer.parseInt(CUR_PAGE);
        } else {
            cur_page = 1;
        }
        List list = (List) request.getAttribute("query");//获取搜索记录
        System.out.println("[PagingServlet]:接收到前端查询条件:" + list);
        //携带条件获取pageBean对象，封装了前端所有要显示的数据：
        PageBean page = new ServiceImpl().getPage(cur_page, 10, list);//在此创建pageBean
        //封装转发
        request.setAttribute("page", page);
        request.getRequestDispatcher("/showUsers.jsp").forward(request, response);
        return;

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
