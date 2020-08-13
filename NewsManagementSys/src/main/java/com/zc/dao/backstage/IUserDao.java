package com.zc.dao.backstage;

import com.zc.entity.User;
import com.zc.utils.DaoProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository()
public interface IUserDao {

    @Select("select * from user where uname = #{name}")
    User findUserByName(String name);

    @Select("select * from user where uname = #{name} and uidentity = #{identity}")
    User findUserByNameId(String name,String identity);

    @Select("select * from user where uid = #{uid}")
    User findUserById(int uid);

    @Insert("insert into user(uname,upassword,usex,uprofile,uemail,uphone,uidentity)values(#{uname},#{upassword},#{usex},#{uprofile},#{uemail},#{uphone},#{uidentity})")
    @Options(useGeneratedKeys = true,keyProperty = "uid",keyColumn = "uid")
    Integer addUser(User user);

    @Select("delete from user where uid = #{user_id}")
    Integer delUserById(int user_id);

    @Update("update user set uname=#{uname},upassword=#{upassword},usex=#{usex},uemail=#{uemail},uphone=#{uphone},uprofile=#{uprofile} where uid=#{uid}")
    Integer updateUser(User user);

    @Select("select * from user")
    List<User> findAllUser();

    //方法内部的参数作用是向注解内的方法提供参数
    @SelectProvider(type= DaoProvider.class,method = "findAllUserByCondition")
    List<User> findAllUserByCondition(User pc);

    //更新用户头像
    @Update("update user set uprofile = #{uprofile} where uid = #{uid}")
    void updateUprofile(User user);

}
