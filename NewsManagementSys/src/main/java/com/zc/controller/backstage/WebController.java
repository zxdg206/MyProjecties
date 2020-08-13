package com.zc.controller.backstage;

import com.zc.entity.User;
import com.zc.service.backstage.impl.WebServiceImpl;
import com.zc.service.backstage.interf.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("web")
public class WebController {

    @Autowired
    WebServiceImpl service;
    @Autowired
    IUserService ser;

    //用户登陆
    @RequestMapping(value = "userlogin")
    public String AdminLogin(User loginuser,String checkcode, HttpServletRequest request){
        if(loginuser==null){
            return "news/login";
        }
        HttpSession session = request.getSession();

        if(session.getAttribute("uidentity")=="新闻管理员" || session.getAttribute("uidentity")=="新闻管理员"){
            return "backstage/welcome";
        }
        if(session.getAttribute("uidentity")=="普通用户"){
            return "news/index";
        }

        User user = service.findUserByNameId(loginuser.getUname(),loginuser.getUidentity());
        System.out.println(user);
        if(user == null){
            request.setAttribute("msg","用户名错误");
            return "news/login";
        }
        request.setAttribute("rname",loginuser.getUname());
        if(!loginuser.getUpassword().equals(user.getUpassword())){
            request.setAttribute("msg","密码错误");
            return "news/login";
        }
        request.setAttribute("password",loginuser.getUpassword());
        if(!checkcode.equalsIgnoreCase((String) session.getAttribute("CHECKCODE"))){
            request.setAttribute("msg","验证码错误");
            return "news/login";
        }

        //确认登陆，更新登陆时间,存入状态信息
        service.updateLoginTime(user);
        session.removeAttribute("CHECKCODE");

        session.setAttribute("uname",user.getUname());
        session.setAttribute("uidentity",user.getUidentity());
        System.out.println(user.getUprofile());
        session.setAttribute("uprofile",user.getUprofile());
        session.setAttribute("ulastlogintime",user.getUlastlogintime());
        session.setAttribute("uid",user.getUid());

        request.setAttribute("msg","登陆成功");
        //根据身份转发页面
        switch(loginuser.getUidentity()){
            case "普通用户":return "forward:/project/toHome";
            case "新闻管理员":return "backstage/welcome";
            case "超级用户":return "backstage/welcome";
        }
        System.out.println("还会转发吗？");
        return "error/404";
    }

    //退出登陆
    @RequestMapping("exitLogin")
    public String exitLogin(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("uname");
        session.removeAttribute("uidentity");
        session.removeAttribute("uprofile");
        session.removeAttribute("ulastlogintime");
        session.removeAttribute("uid");
        return "news/login";
    }


    //用户注册
    @RequestMapping("userRegist")
    public String userRegist(@RequestParam("uimg") @Nullable MultipartFile uimg, HttpServletRequest request,
                          User user) throws IOException {
        if(user.getUname()==null){
            return "news/regist";
        }
        user.setUidentity("普通用户");
        int i = ser.addUser(user);
        if(i==0){
            request.setAttribute("msg","用户已经存在.");
            return "news/regist";
        }
        //处理头像
        if (uimg != null) {
            System.out.println("添加用户时选择了上传头像");
            if (!uimg.isEmpty()) {
                String savepath = request.getSession().getServletContext().getRealPath("/") + "/imgs/profile/";
                String filename = "u_" + new Date().getTime() + ".jpg";
                String save_uprofile = "/imgs/profile/" + filename;
                uimg.transferTo(new File(savepath + filename));
                user.setUprofile(save_uprofile);
                System.out.println("保存的用户头像Url：" + save_uprofile);
                ser.updateUprofile(user);
            }
        }
        request.setAttribute("msg","注册成功！");
        request.setAttribute("uname",user.getUname());
        return "/news/login";
    }

    //检测用户是否存在
    @RequestMapping("checkName")
    @ResponseBody
    public Integer findUserByName(String uname){
        /**
         * 1为存在,0为不存在
         */
        System.out.println("访问");
        return service.findUserByName(uname)==null?0:1;
    }

    //验证码
    @RequestMapping("checkcode")
    public void Checkcode(HttpServletResponse response, HttpServletRequest request) throws IOException {
        System.out.println("访问了验证码");
        //服务器通知浏览器不要缓存
        response.setHeader("pragma", "no-cache");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("expires", "0");
        //在内存中创建一个图片，默认黑色背景
        int width = 80;
        int height = 30;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        //调用java绘图工具库
        Graphics g = image.getGraphics();
        //设置画笔颜色为灰色
        g.setColor(Color.GRAY);
        //填充图片
        g.fillRect(0, 0, width, height);
        //产生4个随机验证码
        String code = "0123456789ABCDEFGHIJKabcdefghijk";
        int size = code.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= 4; i++) {
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = code.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        String checkCode = sb.toString();
        //将验证码放入HttpSession中
        request.getSession().setAttribute("CHECKCODE", checkCode);

        //设置画笔颜色为黄色
        g.setColor(Color.YELLOW);
        //设置字体的小大
        g.setFont(new Font("黑体", Font.BOLD, 24));
        //向图片上写入验证码
        g.drawString(checkCode, 15, 25);

        //将内存中的图片输出到浏览器,对象/格式/流
        ImageIO.write(image, "PNG", response.getOutputStream());
    }



    //访问后台首页
    @RequestMapping("welcome")
    public String welcome() {
        /**
         * 首页回显的数据是在session中取的。
         */
        return "backstage/welcome";
    }


    //访问index(删除)
    @RequestMapping("index")
    public String index() {
        return "news/index";
    }

    //访问个人中心
    @RequestMapping("toPersonal")
    public String toPersional(HttpServletRequest request){
        HttpSession session = request.getSession();
        int uid = (int)session.getAttribute("uid");
        User userById = ser.findUserById(uid);
        request.setAttribute("user",userById);
        System.out.println("根据session取出的user:"+userById);
        return "backstage/admin-personal";
    }

    //保存个人中心信息
    @RequestMapping("editPersonal")
    public String editPersonal(@RequestParam("eimg") @Nullable MultipartFile eimg, HttpServletRequest request, User user) throws IOException {
        System.out.println("封装的editPersonal用户：" + user);
        if(user.getUname()==null){
            return "forward:web/toPersonal";
        }
        if (!eimg.isEmpty()) {
            //先对用户以前的头像进行删除
            System.out.println("一：选择了上传头像");
            if (user.getUprofile() != null) {
                System.out.println("1.1：当前封装的用户存在原始头像,URL是：" + user.getUprofile());
                File file = new File(request.getSession().getServletContext().getRealPath("/") + user.getUprofile());
                if (file.exists()) {
                    System.out.println("1.2检测到项目User的头像文件存在,调用方法是否成功删除：" + file.delete());
                }else{
                    request.setAttribute("msg","该User的头像在项目中已经不存在");
                    return "error/404";
                }
            } else {
                System.out.println("一：接收的用户头像值为空");
            }
            //再对用户添加新头像
            String savepath = request.getSession().getServletContext().getRealPath("/") + "/imgs/profile/";
            String filename = "u"+user.getUid()+"_" + new Date().getTime() + ".jpg";
            System.out.println("1.3存储的头像文件路径："+savepath+filename);
            String profile_url = "/imgs/profile/" + filename;
            eimg.transferTo(new File(savepath + filename));
            //更新user对象的头像信息
            user.setUprofile(profile_url);
            System.out.println("1.4保存的新的用户头像Url：" + profile_url);
        } else {
            System.out.println("一：未选择上传头像");
        }
        System.out.println("二:更新数据库前的user:"+user);
        Integer integer = ser.updateUser(user);
        System.out.println("三:更新的状态码："+integer);
        User after = ser.findUserById(user.getUid());
        System.out.println("四：更新后的user对象：" + after);
        /**
         * 更新session中的值
         */
        HttpSession session = request.getSession();
        session.setAttribute("uname",after.getUname());
        session.setAttribute("uidentity",after.getUidentity());
        session.setAttribute("uprofile",after.getUprofile());
        return "forward:/web/toPersonal";
    }

    //访问index
    @RequestMapping("toError")
    public String toError(){
        return "error/404";
    }

}


