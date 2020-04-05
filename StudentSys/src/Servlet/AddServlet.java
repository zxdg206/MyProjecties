package Servlet;

import JavaBean.Student;
import Service.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从request域中获取提交的信息,务必注意设置requesrd 编码
        request.setCharacterEncoding("utf-8");
        String sno = request.getParameter("sno");
        String sname = request.getParameter("sname");
        String ssex = request.getParameter("ssex");
        int sage = Integer.parseInt(request.getParameter("sage"));
        String sdept = request.getParameter("sdept");
        String phone = request.getParameter("phone");
        //封装到javabean中
        Student student = new Student(sno,sname,ssex,sage,sdept,phone);
        System.out.println("[AddServlet]");
        System.out.println(student.toString());
        //调用方法插入数据
        int status = new ServiceImpl().addStudent(student);
        //如果插入成功，转发/重定向至SelectServlet,如果插入失败，转发错误信息到add.jsp前端
        System.out.println("插入状态码"+status);
        if(status==1){
//            request.getRequestDispatcher("/PagingServlet").forward(request,response);
            response.sendRedirect(request.getContextPath()+"/PagingServlet");
        }else if(status==0){
            //插入失败
            request.setAttribute("existmsg","该学号的用户已存在");
            //将获取的值原封不动传回去
            request.setAttribute("sno",sno);
            request.setAttribute("sname",sname);
            request.setAttribute("ssex",ssex);
            request.setAttribute("sage",sage);
            request.setAttribute("sdept",sdept);
            request.setAttribute("phone",phone);
            request.getRequestDispatcher("/add.jsp").forward(request,response);
        }else if(status==-1){
            request.setAttribute("errormsg","可能有未知的SQL错误，请查看控制台输出");
            //转向错误页面
            request.getRequestDispatcher("/ErrorPage.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
