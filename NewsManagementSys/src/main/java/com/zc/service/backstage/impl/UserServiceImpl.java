package com.zc.service.backstage.impl;

import com.github.pagehelper.PageHelper;
import com.zc.dao.backstage.IUserDao;
import com.zc.entity.User;
import com.zc.service.backstage.interf.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    IUserDao dao;

    //姓名查询
    @Override
    public User findUserByName(String name) {
        return dao.findUserByName(name);
    }

    @Override
    public User findUserByNameId(String name, String identity) {
        return dao.findUserByNameId(name,identity);
    }

    //ID查询
    @Override
    public User findUserById(int id) {
       return dao.findUserById(id);
    }
    //添加用户
    @Override
    public int addUser(User user) {
        //此处返回值0存在用户，1删除用户，-1异常
        User userByName = dao.findUserByName(user.getUname());
        if(userByName!=null){
            return 0;
        }
        Integer integer = dao.addUser(user);
        System.out.println("插入的返回值："+integer);
        return 1;
    }
    //ID删除用户
    @Override
    public int delUserById(int uid) {
        //删除用户时，同步删除头像
        Integer integer = dao.delUserById(uid);
        return 1;
    }
    //更新用户
    @Override
    public Integer updateUser(User user) {
        return dao.updateUser(user);
    }
    //查询全部用户
    @Override
    public List<User> findAllUser(int page,int size) {
        //必须写在dao方法之前,下面不能有其他语句
        PageHelper.startPage(page,size);
        return dao.findAllUser();
    }

    @Override
    public List<User> findAllUserByCondition(User pc){
        PageHelper.startPage(pc.getCurpage(),pc.getPagesize());
       return dao.findAllUserByCondition(pc);
    }

    @Override
    public void updateUprofile(User user) {
        dao.updateUprofile(user);
    }
}
