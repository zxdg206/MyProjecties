package com.zc.dao;

import com.zc.domain.Reader;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReaderDao {

    /**
     * 查询所有的用户
     * @return
     */
    @Select("select * from web.reader")
    List<Reader> findAllReader();
    /**
     * 根据id查询用户对应的对象
     */
    @Select("select * from web.reader where readerid=#{readerid}")
    Reader findReaderById(int readerid);

    /**
     * 插入用户
     */
//    insert into user(username,password)values(#{username},#{password})
    @Insert("insert into reader(readername,password,readerdept)values(#{readername},#{password},#{readerdept})")
    void addReader(Reader reader);

    /**
     * 更新用户数据
     */
    //update user set username=#{username},password=#{password} where id=#{id}
    @Update("update reader set readername=#{readername},password=#{password},readerdept=#{readerdept} where readerid=#{readerid}")
    void updateReader(Reader reader);

    @Select("select bookid from borrow where readerid=#{readerid}")
    List<Integer> findReaderBrrowBookid(int readerid);
}
