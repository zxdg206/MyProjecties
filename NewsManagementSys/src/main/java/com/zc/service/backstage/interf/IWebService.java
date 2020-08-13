package com.zc.service.backstage.interf;

import com.zc.entity.User;


public interface IWebService {


    User findUserByName(String name);
    public User findUserByNameId(String name, String identity);
    Integer updateLoginTime(User user);
}
