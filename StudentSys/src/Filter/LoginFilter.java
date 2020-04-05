package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("过滤器初始化...");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        //排除过滤资源,注意排除css,js等前端页面资源,以及验证码。
        String uri = request.getRequestURI();
        if(uri.contains("/Login.jsp")||uri.contains("/js")||uri.contains("/css")||uri.contains("/fonts")||uri.contains("/checkCode")||uri.contains("/LoginServlet")){
            //对以上资源直接放行
            filterChain.doFilter(request,response);
        }else {
            //获取cookie、session
            HttpSession session = request.getSession();
            //先判断session是否存在已经登陆的标记
                if(session.getAttribute("manager")!=null){
                    filterChain.doFilter(request,response);
                }else {
                    //不存在登陆标记，则转发至登陆页面
                    request.setAttribute("errormsg","您尚未登陆，请先登陆");
                    request.getRequestDispatcher("/login.jsp").forward(request,response);
                }
        }
    }

    @Override
    public void destroy() {
        System.out.println("过滤器销毁");
    }
}
