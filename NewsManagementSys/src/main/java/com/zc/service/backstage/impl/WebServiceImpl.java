package com.zc.service.backstage.impl;

import com.zc.dao.backstage.IWebDao;
import com.zc.entity.User;
import com.zc.service.backstage.interf.IWebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("IBackService")
public class WebServiceImpl implements IWebService {

    @Autowired
    IWebDao dao;

    //查询全部用户
    @Override
        public User findUserByName(String name) {
        return dao.findUserByName(name);
    }

    //查询ByName和uidentity
    @Override
    public User findUserByNameId(String uname, String uidentity) {
        return dao.findUserByNameId(uname,uidentity);
    }

    //更新登陆时间
    @Override
    public Integer updateLoginTime(User user) {
        return dao.updateLoginTime(user);
    }

}
