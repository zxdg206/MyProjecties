package com.zc.dao;

import com.zc.domain.Contor;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ContorDao {
    //查询所有管理员
    @Select("select * from contor")
    List<Contor> findAllContor();

    //根据id查询管理员
    @Select("select * from contor where contorid=#{contorid}")
    Contor getContorById(int id);

    //添加管理员
//    insert into reader(readername,password,readerdept)values(#{readername},#{password},#{readerdept})
    @Insert("insert into contor(contorname, password)values(#{contorname},#{password})")
    void insertContor(Contor contor);

    //删除管理员
    @Delete("delete from contor where contorid = #{contorid}")
    void delContor(int id);

    //管理员修改信息
//    update borrow set readerid=#{readerid},bookid=#{bookid},borrowdate=#{borrowdate}
    @Update("update contor set contorid=#{contorid},contorname=#{contorname},password=#{password}")
    void updeteContor(Contor contor);

}
