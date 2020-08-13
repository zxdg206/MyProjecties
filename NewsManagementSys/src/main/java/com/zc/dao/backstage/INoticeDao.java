package com.zc.dao.backstage;

import com.zc.entity.Notice;
import com.zc.utils.DaoProvider;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository()
public interface INoticeDao {

    //根据oid查找通知
    @Select("select * from notice where oid = #{oid}")
    Notice findNoticeByOid(int oid);
    //根据oid删除Notice
    @Delete("delete from notice where oid = #{oid}")
    void delNoticeByOid(int oid);
    //查找全部ID
    @SelectProvider(type = DaoProvider.class,method = "findNoticeBySearch")
    List<Notice> findNoticeBySearch(Notice notice);
    //查找全部ID
    @Select("select * from notice")
    List<Notice> findNotice();
    //添加Notice
    @Insert("insert into notice(otitle,ocontent)values(#{otitle},#{ocontent})")
    void addNotice(Notice notice);

}
