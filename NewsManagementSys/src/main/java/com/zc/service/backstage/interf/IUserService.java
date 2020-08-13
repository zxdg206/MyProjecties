package com.zc.service.backstage.interf;


import com.zc.entity.User;
import java.util.List;

public interface IUserService {

    //查询用户byName
    User findUserByName(String name);
    //查询指定身份的用户
    User findUserByNameId(String name,String identity);
    //查询用户byID
    User findUserById(int id);
    //添加用户
    int addUser(User user);
    //删除用户
    int delUserById(int user_id);
    //更新用户
    Integer updateUser(User user);
    //page是当前页码
    List<User> findAllUser(int page,int size);
    //模糊查找用户
    public List<User> findAllUserByCondition(User pc);
    //更新用户头像
    void updateUprofile(User user);

}
