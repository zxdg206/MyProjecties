package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 封装查询条件
 */
@WebFilter(value = {"/DeleteServlet","/PagingServlet","/ModifyServlet","/PackageServlet"})
public class UriFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        resp.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //接收get请求的传来的查询条件（c_sname,c_sno,c_sdept）封装数据。
        String name = request.getParameter("c_name");
        String no = request.getParameter("c_no");
        String sdept = request.getParameter("c_sdept");
        List<String> list = new ArrayList();
        list.add(name);
        list.add(no);
        list.add(sdept);
        //对输入条件去空格
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i) != null && !"".equals(list.get(i))) {//如果存在输入条件
                System.out.println("[PagingServlet]:替换一次");
                list.set(i, list.get(i).replaceAll(" ", ""));
            }
        }
        request.setAttribute("query", list);//封装搜索记录,以集合返回
        System.out.println("集合内容为："+list.toString());
        System.out.println("过滤器执行");
        chain.doFilter(request, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
