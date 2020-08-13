package com.zc.dao.backstage;

import com.zc.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;


@Repository()
public interface IWebDao {

    //用户名查询用户
    @Select("select * from user where uname = #{uname}")
    User findUserByName(String uname);
    //用户名ID查询用户
    @Select("select * from user where uname = #{uname} and uidentity = #{uidentity}")
    User findUserByNameId(@Param("uname")String uname, @Param("uidentity")String uidentity);
    //更新登陆时间
    @Update("update user set ulastlogintime = CURRENT_TIMESTAMP where uid=#{uid};")
    Integer updateLoginTime(User user);
}
