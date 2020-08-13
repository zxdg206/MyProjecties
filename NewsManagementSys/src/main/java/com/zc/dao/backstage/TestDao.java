package com.zc.dao.backstage;


import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository()
public interface TestDao {

    //测试查找的返回值
    @Select("select count(*) from user")
    Integer count();

    @Insert("insert into test(tid,msg) values(#{id},'123456')")
    public boolean insert(int id);

    @Delete("delete from test where tid = #{id}")
    public boolean del(int id);

    @Delete("update test set msg = '123' where tid = 1")
    public Integer update();

//携带自增值
//    @Insert("insert into mtest(msg) values(#{msg})")
//    @Options(useGeneratedKeys = true, keyProperty = "tid", keyColumn = "tid")
//    Integer insert2(Mtest mtest);

}
