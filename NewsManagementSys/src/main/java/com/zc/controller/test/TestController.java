package com.zc.controller.test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zc.entity.User;
import com.zc.service.backstage.interf.IWebService;
import com.zc.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("test")
public class TestController {
    @Autowired
    IWebService service;
    //测试访问登陆界面
    @RequestMapping("toLoginJSP")
    public String toLoginJSP(){
        System.out.println("访问login");
        return "news/login";
    }
    //测试访问页面
    @RequestMapping("topage")
    public String topage(){
        System.out.println("访问page");
        return "backstage/testCSS";
    }
    //测试MVC连通性
    @RequestMapping("MVC")
    public String MVC(){
        System.out.println("进入MVC");
        return "OK";
    }
    //测试MVC连通性
    @RequestMapping("toWelcome")
    public String wel(){
        System.out.println("进入MVC");
        System.out.println("访问后台首页");
        return "backstage/welcome";
    }
    //测试return代码
    @RequestMapping("return")
    public String turn(){
        System.out.println("1");
        return "backstage/welcome";
    }
    //测试include导入
    @RequestMapping("include")
    public String include(){
        return "backstage/test";
    }

    //测试测试Json和Ajax导入以及自动封装
    @RequestMapping("ja")
    public String jsonajax(User user, String a, Model model){
        System.out.println(user);
        System.out.println(a);
        System.out.println("访问Json.jsp");
        Date  date= new Date();
        model.addAttribute("testDate",date);
        System.out.println("date是："+date);
        return "backstage/json";
    }
    //测试并赶回user的json对象
    @RequestMapping("js")
    @ResponseBody
    public String jsonas() throws JsonProcessingException {
        //首先需要一个JACKSON对象
        //此方法直接返回json字符串在页面显示,最好用于异步传输请求
        User u = new User();
        u.setUname("周聪君");
        u.setUsex("男");
        u.setUphone("13762515454");
        System.out.println(u);
        System.out.println("访问js控制器");
        return JsonUtil.getJson(u);
    }
    //格式化日期
    @RequestMapping("js2")
    @ResponseBody
    public String j2() throws JsonProcessingException {
        //测试时间
       return JsonUtil.getJson(new Date());
    }
    //ajax异步传输验证用户名
    @RequestMapping("ajax")
    @ResponseBody
    public String aj(String uname){
        System.out.println("发送了ajax请求,name是："+uname);
        String msg;
        if("zc".equals(uname)){
            msg =  "*";
        }else {
            msg = "用户名不存在";
        }
        return msg;
    }
    //ajax异步传输添加标签
    @RequestMapping("ajax2")
    @ResponseBody
    public List aj2() throws JsonProcessingException {
        System.out.println("进入ajax2");
        List list = new ArrayList();
        User u1 = new User();
        User u2 = new User();
        User u3 = new User();
        u1.setUname("zc");
        u2.setUname("ww");
        u3.setUname("xx");
        list.add(u1);
        list.add(u2);
        list.add(u3);
        return list;
    }
    @RequestMapping("ajax4")
    @ResponseBody
    public User aj4() throws JsonProcessingException {
        System.out.println("进入ajax4");
        User user = new User();
        user.setUname("ABC");
        user.setUid(123);
        return user;
    }

    //访问editor.jsp
    @RequestMapping("editor")
    public String aj3(){
        return "backstage/editor";
    }


    @RequestMapping("toSingle")
    public String t6() throws IOException {
        return "news/single";
    }
    @RequestMapping("toIndex2")
    public String toIndex2() throws IOException {
        return "news/index2";
    }
    @RequestMapping("toList")
    public String toList() throws IOException {
        return "news/list";
    }
    @RequestMapping("toSearch")
    public String toSearch() throws IOException {
        return "news/search";
    }
    @RequestMapping("toNewsAdd")
    public String toNewsAdd(){

        return "backstage/admin-news-add";
    }


    //访问公告页面
    @RequestMapping("toNotice")
    public String toNotice() {
        return "backstage/admin-notice";
    }

    //访问文本溢出测试页面
    @RequestMapping("toText")
    public String toText(HttpServletRequest request) {
        request.setAttribute("date",new Date());
        return "backstage/text";
    }
}
