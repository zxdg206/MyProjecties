package com.zc.controller.news;

import com.zc.service.backstage.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 专门进行前端表单验证的controller
 */
@Controller
@RequestMapping("check")
public class checkController {

    @Autowired
    UserServiceImpl service;



}
