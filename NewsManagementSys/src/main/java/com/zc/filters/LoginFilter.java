package com.zc.filters;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("登陆拦截：请求"+request.getRequestURI());
        Object uidentity = request.getSession().getAttribute("uidentity");
        if(uidentity == null || "".equals(uidentity)){
            System.out.println("登陆拦截：未登陆拒绝访问");
            request.setAttribute("msg","请先登陆");
            request.getRequestDispatcher("/project/toLogin").forward(request,response);
        }
        System.out.println("登陆拦截：已经登陆放行");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
