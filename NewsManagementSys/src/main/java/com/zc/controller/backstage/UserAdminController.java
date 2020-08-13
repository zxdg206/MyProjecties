package com.zc.controller.backstage;


import com.github.pagehelper.PageInfo;
import com.zc.entity.User;
import com.zc.service.backstage.impl.UserServiceImpl;
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
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 用户管理的控制类
 */
@Controller
@RequestMapping("user")
public class UserAdminController {

    @Autowired
    UserServiceImpl service;

    //访问管理用户页面（查询全部用户，需要指定默认的分页数据）
    @RequestMapping("admin-user")
    public String adminUser(Model model,
                            @RequestParam(name = "curpage", defaultValue = "1", required = true) int curpage,
                            @RequestParam(name = "pagesize", defaultValue = "10", required = true) int pagesize,
                            String uinfo) {

        User all_user = new User(curpage, pagesize);
        //内部已经完成模糊查询的转换
        all_user.setUinfo(uinfo);
        //这个查询结果是包含用户本身
        List<User> allUser = service.findAllUserByCondition(all_user);
        //分页插件的构造函数可以直接赋值,导航长度是10自适应
        PageInfo pi = new PageInfo(allUser, 10);
        if (pi.getTotal() == 0) {
            model.addAttribute("msg", "相关记录不存在！");
        }
        System.out.println(pi.getList());
        //设置下一页的边界
        if (pi.getNextPage() <= 0) {
            pi.setNextPage(pi.getNavigateLastPage());
        }
        model.addAttribute("pageInfo", pi);
        //判断是否有查询条件,有则回显查询条件
        if (uinfo != null) {
            model.addAttribute("uinfo", uinfo);
        }
        return "backstage/admin-user";
    }

    //批量删除用户byID
    @RequestMapping("delUsers")
    public String delUsers(Model model, HttpServletRequest request) {

        String[] res = request.getParameterValues("res");
        HttpSession session = request.getSession();
        String realPath = request.getSession().getServletContext().getRealPath("/");
        int cuid = (int) session.getAttribute("uid");
        for (String uid : res) {
            int i = Integer.parseInt(uid);
            if (i == cuid) {
                model.addAttribute("msg", "无法删除当前会话用户");
                continue;
            }
            //本地头像删除
            User userById = service.findUserById(i);
            System.out.println("待删除的用户：" + userById);
            String url = userById.getUprofile();
            if (url != null && !"".equals(url)) {
                System.out.println("用户头像存在");
                File file = new File(realPath + url);
                if (file.exists()) {
                    System.out.println("项目文件实体存在,是否成功删除：" + file.delete());
                }
            }
            service.delUserById(i);
        }
        return "forward:/user/admin-user";
    }

    //添加用户
    @RequestMapping("addUser")
    public String addUser(@RequestParam("uimg") @Nullable MultipartFile uimg, HttpServletRequest request,
                          User user) throws IOException {

        if(user.getUname()==null){
            return "forward:/user/admin-user";
        }

        int i = service.addUser(user);

        if(i==0){
            request.setAttribute("msg","用户名已经存在.");
            return "error/404";
        }
        if (uimg != null) {
            System.out.println("添加用户时选择了上传头像");
            if (!uimg.isEmpty()) {
                String savepath = request.getSession().getServletContext().getRealPath("/") + "/imgs/profile/";
                String filename = user.getUid() + "_" + new Date().getTime() + ".jpg";
                String save_uprofile = "/imgs/profile/" + filename;
                uimg.transferTo(new File(savepath + filename));
                user.setUprofile(save_uprofile);
                System.out.println("保存的用户头像Url：" + save_uprofile);
                //更新用户头像
                service.updateUprofile(user);
            }
        }
        return "forward:/user/admin-user";
    }

    //查询单个用户信息,如果返回自定义对象,必须是Object类型
    @RequestMapping("findUser")
    @ResponseBody
    public Object findUser2(String uid) {
        User userById = service.findUserById(Integer.parseInt(uid));
        Date date = userById.getUlastlogintime();
        System.out.println("时间是：" + date);
        return userById;
    }

    //编辑更新用户
    @RequestMapping("editUser")
    public String editUse(@RequestParam("eimg") @Nullable MultipartFile eimg, HttpServletRequest request, User user) throws IOException {
        System.out.println("进入editUser用户：" + user);
        System.out.println("此用户的profile:" + user.getUprofile());
        if (user.getUid()==0){
            return "forward:/user/admin-user";
        }
        if (!eimg.isEmpty()) {
            //先对用户以前的头像进行删除
            System.out.println("选择了上传头像");
            if (user.getUprofile() != null) {
                System.out.println("存在头像URL" + user.getUprofile());
                File file = new File(request.getSession().getServletContext().getRealPath("/") + user.getUprofile());
                if (file.exists()) {
                    System.out.println("项目文件实体存在,是否成功删除：" + file.delete());
                }
            } else {
                System.out.println("接收的用户头像值为空");
            }
            //再对用户添加新头像
            String savepath = request.getSession().getServletContext().getRealPath("/") + "/imgs/profile/";
            String filename = "u_" + new Date().getTime() + ".jpg";
            String profile_url = "/imgs/profile/" + filename;
            eimg.transferTo(new File(savepath + filename));
            user.setUprofile(profile_url);
            System.out.println("保存的新的用户头像Url：" + profile_url);
            System.out.println("删除用户以前的头像");

        } else {
            System.out.println("未选择上传头像");
        }
        Integer integer = service.updateUser(user);
        System.out.println("Updata的返回值是：" + integer);
        return "forward:/user/admin-user";
    }


}
