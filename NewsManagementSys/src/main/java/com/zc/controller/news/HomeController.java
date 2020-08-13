package com.zc.controller.news;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zc.entity.Comment;
import com.zc.entity.News;
import com.zc.entity.Notice;
import com.zc.service.backstage.interf.INewsService;
import com.zc.service.news.interf.IHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("project")
public class HomeController {


    @Autowired
    INewsService service;
    @Autowired
    IHomeService home;

    //访问阅读新闻
    @RequestMapping("viewNews")
    public String viewNews(@RequestParam(name = "curpage", defaultValue = "1", required = true) int curpage,
                           int nid, Model model) {
        System.out.println("接收的nid："+nid);
        //更新观看量
        service.updateViewsByNid(nid);
        News news = service.findNewsByNid(nid);

        //推荐新闻
        List<News> recommendNews = service.findRecommendNews(news.getNid(),news.getMenu());
        model.addAttribute("news",news);
        model.addAttribute("recommend",recommendNews);
        //接收的评论
        List<Comment> commentOfNid = service.findCommentOfNid(curpage,nid);

        PageInfo pageInfo = new PageInfo(commentOfNid,5);
        //下一页边界不自动置为0
        if (pageInfo.getNextPage() <= 0) {
            pageInfo.setNextPage(pageInfo.getNavigateLastPage());
        }
        model.addAttribute("pageInfo",pageInfo);
        return "news/single";
    }

    //发布评论
    @RequestMapping("sendComment")
    public  String sendComment(Comment comment,Model model){
        System.out.println(comment);
        if(comment.getNid()==0){
            return "forward:/project/toHome";
        }
        model.addAttribute("nid",comment.getNid());
        service.addComment(comment);
        return "forward:/project/viewNews";
    }


    //访问首页
    @RequestMapping("toHome")
    public String toHome(Model model) {
        /**
         * 只存在六个固定栏目，因此几乎需要六个集合依次命名为：
         * sport
         * health
         * tech
         * business
         * game
         * happy
         */
        String menu;
        List<News> entertainment = home.findHomeNewsByMenuLimit("娱乐");
        List<News> health = home.findHomeNewsByMenuLimit("健康");
        List<News> game = home.findHomeNewsByMenuLimit("游戏");
        List<News> tech = home.findHomeNewsByMenuLimit("科技");
        List<News> sport = home.findHomeNewsByMenuLimit("运动");
        List<News> business = home.findHomeNewsByMenuLimit("财经");

        model.addAttribute("business",business);
        model.addAttribute("entertainment",entertainment);
        model.addAttribute("health",health);
        model.addAttribute("game",game);
        model.addAttribute("tech",tech);
        model.addAttribute("sport",sport);

        return "news/index2";
    }

    //访问List页面
    @RequestMapping("toList")
    public String toList(@RequestParam(name = "curpage", defaultValue = "1", required = true) Integer curpage,
                         @RequestParam(name = "menu", defaultValue = "-1", required = true) String menu,
                         @RequestParam(name = "type", defaultValue = "-1", required = true) String type,
                         Model model) {

        if(menu.equals("-1")||type.equals("-1")){
            model.addAttribute("msg","没有选择分类");
            return "error/404";
        }
        List<News> news = home.findHomeNewsByMenuType(curpage,menu,type);
        PageInfo pageInfo = new PageInfo(news);
        if(pageInfo.getNextPage()<=0){
            pageInfo.setNextPage(pageInfo.getPages());
        }
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("menu",menu);
        model.addAttribute("type",type);
        return "news/list";
    }

    //搜索新闻
    @RequestMapping("searchNews")
    public String SearchNews(@RequestParam(name = "curpage", defaultValue = "1", required = true) Integer curpage,
                             String search, Model model) {

        System.out.println("search:"+search);
        if(search == null || "".equals(search)){
            return "forward:toHome";
        }
        model.addAttribute("search",search);
        search = "%"+search+"%";

        List<News> news = home.findNewsBySearch(curpage, search);
        PageInfo pageInfo = new PageInfo(news);
        if(pageInfo.getNextPage()<=0){
            pageInfo.setNextPage(pageInfo.getPages());
        }
        model.addAttribute("pageInfo",pageInfo);
        return "news/search";
    }


    //点赞
    @RequestMapping("likenews")
    @ResponseBody
    public String likeNews(Integer nid, HttpServletRequest request){
        //需要判断是否登陆
        if(request.getSession().getAttribute("uname")==null){
            request.setAttribute("msg","登陆后才能对新闻点赞");
            return null;
        }
        service.updateLikesOfNews(nid);
        System.out.println("更新点赞");
        request.setAttribute("islike","true");
        return ""+service.getLikesOfNews(nid);
    }

    //访问登录页
    @RequestMapping("toLogin")
    public String toLogin() {
        return "news/login";
    }

    //访问登陆页面
    @RequestMapping("login")
    public String login() {
        return "news/login";
    }

    //访问注册页
    @RequestMapping("toRegist")
    public String toRegist() {
        return "news/regist";
    }

    //访问公告列表
    @RequestMapping("toNoticeList")
    public String toNotice(@RequestParam(name = "curpage", defaultValue = "1", required = true)int curpage,
                           Model model) {
        List<Notice> notice = home.findNotice(curpage);
        PageInfo pageInfo = new PageInfo(notice,10);
        model.addAttribute("pageInfo",pageInfo);
        return "news/notice-list";
    }
    //查看公告
    @RequestMapping("viewsNotice")
    public String notice(@RequestParam(name = "oid", defaultValue = "1", required = true)int oid,
                           Model model) {
        if(oid == 1){
            model.addAttribute("msg","不存在此公告");
            return "error/404";
        }
        Notice noticeByOid = home.findNoticeByOid(oid);
        model.addAttribute("notice",noticeByOid);
        return "news/notice";
    }



}
