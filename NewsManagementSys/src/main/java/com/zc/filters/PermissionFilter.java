package com.zc.filters;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PermissionFilter implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uidentity = (String)request.getSession().getAttribute("uidentity");
        if(uidentity!=null&&uidentity.equals("普通用户")) {
            request.setAttribute("msg", "你没有权限访问此资源,请联系管理员");
            request.getRequestDispatcher("/WEB-INF/pages/error/404.jsp").forward(request, response);
            return false;
        }
        return true;
    }
}
