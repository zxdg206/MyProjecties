package com.zc.controller.backstage;


import com.github.pagehelper.PageInfo;
import com.zc.entity.News;
import com.zc.entity.RollNews;
import com.zc.service.backstage.impl.NewsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zc.entity.Comment;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("news")
public class NewsAdminController {

    @Autowired
    NewsServiceImpl service;

    //访问新闻管理首页
    @RequestMapping("toNewsManage")
    public String toNewsMange(Model model,
                              @RequestParam(name = "curpage", defaultValue = "1", required = true) int curpage,
                              @RequestParam(name = "pagesize", defaultValue = "10", required = true) int pagesize,
                              HttpServletRequest request,
                              String search) {

        News all_news = new News(curpage, pagesize);
        //内部已经完成模糊查询的转换
        all_news.setSearch(search);
        //先对身份验证，只有管理员能管理全部新闻
        String uidentity = (String) request.getSession().getAttribute("uidentity");
        List<News> allNews;
        //身份判断，判断是管理员还是超级用户
        if(uidentity.equals("新闻管理员")){
            String uname = (String) request.getSession().getAttribute("uname");
            all_news.setAuthor(uname);
            allNews = service.findAllNewsOfManageByCondition(all_news);
        }else {
            allNews = service.findAllNewsByCondition(all_news);
        }
        //分页插件的构造函数可以直接赋值,导航长度是10自适应
        PageInfo pi = new PageInfo(allNews, 10);
        if (pi.getTotal() == 0) {
            model.addAttribute("msg", "相关记录不存在！");
        }
        //设置末页的后一页边界
        if (pi.getNextPage() <= 0) {
            pi.setNextPage(pi.getNavigateLastPage());
        }
        model.addAttribute("pageInfo", pi);
        //判断是否有查询条件,有则回显查询条件
        if (search != null) {
            model.addAttribute("search", search);
        }
        System.out.println("返回新闻管理首页");
        return "backstage/admin-news-manage";
    }

    //在模态窗回显对应的首页新闻
    @RequestMapping("showIndexNews")
    @ResponseBody
    public List showIndexNews(String local,Model model){
        if("topnews".equals(local)){
            return service.findTopNews();
        }
        else if("rollnews".equals(local)){
            return service.findRollNews();
        }
        else {
            model.addAttribute("msg","输入异常");
            return null;
        }
    }

    //撤销首页新闻
    @RequestMapping("delIndexNews")
    @ResponseBody
    public String delIndexNews(@RequestParam(name = "nid",defaultValue = "-1") int nid,String local,Model model){
        /**
         *根据类型删除
         */
        if(nid==-1){
            model.addAttribute("msg","没有新闻nid");
            return "error/404";
        }
        System.out.println("前端传回的id："+nid);
        System.out.println("前端传回的类型："+local);
        switch (local){
            case "topnews":service.delTopNewsByTid(nid);break;
            case "rollnews":service.delRollNewsByRid(nid);break;
        }
        return "backstage/admin-news-manage";
    }



    //添加新闻Servlet
    @RequestMapping("newsadd")
    public String newsadd(@RequestParam("n_src")@Nullable MultipartFile n_src, @RequestParam("n_img")@Nullable MultipartFile n_img,
                          News news, Integer rollnews, Integer topnews, HttpServletRequest request) throws IOException {
        if(news.getTitle()==null){
            request.setAttribute("msg","没有选择内容");
            return "backstage/admin-news-add";
        }
        String savepath = request.getSession().getServletContext().getRealPath("/");
        if(!n_img.isEmpty()){
            String path =savepath+"/imgs/newscover/";
            String filename = news.getNid()+"-"+new Date().getTime()+".jpg";
            String save_img_name = "/imgs/newscover/"+filename;
            n_img.transferTo(new File(path+filename));
            news.setNimg(save_img_name);
        }
        if(!n_src.isEmpty()){
            String path =savepath+"/imgs/newsimgs/";
            String filename = news.getNid()+"-"+new Date().getTime()+".jpg";
            String save_src_name = "/imgs/newsimgs/"+filename;
            n_src.transferTo(new File(path+filename));
            news.setNsrc(save_src_name);
        }
        service.addNews(news);
        //处理栏目
        if(rollnews!=null&&rollnews==1){
            service.addRollNews(news);
        }
        if(topnews!=null&&topnews==1){
            service.addTopNews(news);
        }
        request.setAttribute("msg","添加成功");
        return "backstage/admin-news-add";
    }

    //访问添加新闻的页面
    @RequestMapping("toAdminNewsAdd")
    public String toAdminNewsAdd() {
        System.out.println("访问新闻添加页面");
        return "backstage/admin-news-add";
    }

    //删除选中新闻
    @RequestMapping("delCheckNews")
    public String delNews(HttpServletRequest request) {
        String[] res = request.getParameterValues("res");
        if(res==null || res.length==0){
            return "forward:/news/toNewsManage";
        }
        String realPath = request.getSession().getServletContext().getRealPath("/");

        for (String nid : res) {
            int i = Integer.parseInt(nid);
            News news = service.findNewsByNid(i);
            String nimg = news.getNimg();
            String nsrc = news.getNsrc();
            if (nimg != null && !"".equals(nimg)) {
                File file = new File(realPath + nimg);
                if (file.exists()) {
                    System.out.println("项目文件实体存在,删除：" + file.delete());
                }
            }
            if (nsrc != null && !"".equals(nsrc)) {
                File file = new File(realPath + nsrc);
                if (file.exists()) {
                    System.out.println("新闻内容文件实体存在,删除：" + file.delete());
                }
            }
            service.delNewsById(i);
        }
        return "forward:/news/toNewsManage";
    }


    //展示评论
    @RequestMapping("comment")
    @ResponseBody
    public List comment(int nid){
        List<Comment> commentOfNid = service.findCommentOfNidNoPage(nid);
        System.out.println("请求返回Nid是"+nid+"的全部评论");
        System.out.println(commentOfNid);
        return commentOfNid;

    }
    //删除评论
    @RequestMapping("delCommentByCid")
    @ResponseBody
    public String delCommentByCid(int cid){
        int i = service.delCommentByCid(cid);
        /**
         * 应该加入安全删除验证：
         * 1.成功
         * 0.不存在此评论
         * -1.删除失败
         */
        return "删除成功";
    }

    //查询新闻ByID
    @RequestMapping("findNewsByNid")
    @ResponseBody
    public News findNewsByNid(int nid){
        return service.findNewsByNid(nid);
    }

    //编辑新闻
    @RequestMapping("editNews")
    public String editNews(@RequestParam("news_img") @Nullable MultipartFile news_img, @RequestParam("news_src") @Nullable MultipartFile news_src,HttpServletRequest request, News news) throws IOException {
        /**
         * 如果前端默认是没有图片的，那么必须是equal而不是==来判断图片是否为空。
         */
        if(news==null){
            return "forward:/news/toNewsManage";
        }
        System.out.println("进入更新前的新闻：" + news);

        String realPath = request.getSession().getServletContext().getRealPath("/");
        //处理封面
        if(news_img!=null && !news_img.isEmpty()){
            System.out.println("选择了上传新闻封面img");
            if(news.getNimg()!=null && !"".equals(news.getNimg())){
                System.out.println("存在原始封面");
                File file = new File(realPath+news.getNimg());
                if(file.exists())file.delete();
                System.out.println("删除了原来的封面："+news.getNimg());
            }
            String savapath = realPath;
            String imgName = "/imgs/newscover/" + "img_"+news.getNid() + new Date().getTime() + ".jpg";
            news_img.transferTo(new File(savapath+imgName));
            news.setNimg(imgName);
            System.out.println("transferTo执行上传了Img:"+imgName);
        }else {
            System.out.println("未选择上传封面,使用原始封面");
        }

        //处理图片
        if(news_src!=null && !news_src.isEmpty()){
            System.out.println("选择了上传新闻图片src");
            if(news.getNimg()!=null && !"".equals(news.getNimg())){
                File file = new File(realPath+news.getNsrc());
                if(file.exists())file.delete();
                System.out.println("存在原始图片,删除了原来的图片src："+news.getNsrc());
            }
            String savapath = realPath;
            String srcName = "/imgs/newsimgs/"+"src_"+news.getNid()+ + new Date().getTime() + ".jpg";
            news_src.transferTo(new File(savapath+srcName));
            news.setNsrc(srcName);
            System.out.println("transferTo执行上传了Src:"+srcName);
        }else {
            System.out.println("未选择上传内容图片,使用原始图片");
        }
        //更新用户
        service.updateNews(news);
        //更新首页栏目
        if(news.getRollnews().equals("yes")){
            System.out.println("选择了滚动新闻栏目");
            if(service.findRollNewsByNid(news.getNid())==null){
                System.out.println("不存在这个首页新闻，添加RollNews记录"+news.getNid());
                service.addRollNews(news);
            }else {
                System.out.println("已经存在NID是"+news.getNid()+"Rollnews记录;");
            }
        }
        if(news.getTopnews().equals("yes")){
            System.out.println("选择了Top新闻");
            if(service.findTopNewsByNid(news.getNid())==null){
                System.out.println("不存在这个首页新闻，添加Top记录"+news.getNid());
                service.addTopNews(news);
            }else {
                System.out.println("已经存在NID是"+news.getNid()+"Topnews记录;");
            }
        }
        System.out.println("更新后的news:"+service.findNewsByNid(news.getNid()));
        return "forward:/news/toNewsManage";
    }

}

