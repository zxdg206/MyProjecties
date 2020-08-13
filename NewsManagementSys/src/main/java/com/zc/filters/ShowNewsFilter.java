package com.zc.filters;

import com.zc.entity.News;
import com.zc.entity.RollNews;
import com.zc.entity.TopNews;
import com.zc.service.backstage.impl.NewsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowNewsFilter implements HandlerInterceptor {

    @Autowired
    NewsServiceImpl service;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getRequestURI().contains("toHome")) {
            List<RollNews> rollNews = service.findRollNews();
            request.setAttribute("rollnews",rollNews);
        }
        List<TopNews> topNews = service.findTopNews();
        List<News> hotNews = service.findHotNews();
        request.setAttribute("topnews",topNews);
        request.setAttribute("hotnews",hotNews);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
