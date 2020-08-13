package com.zc.dao.news;


import com.zc.entity.News;
import com.zc.entity.Notice;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository()
public interface IHomeDao {

    //查找新闻by新闻Id
    @Select("select * from news where uid = #{id} ")
    News findNewsByID(int id);

    //模糊搜索新闻
    List<News> findNewsByInfo(String info);

    //查找新闻by新闻作者
    News findNewsByAuthor(String author);
    //查找新闻by二级分类
    List<News> findNewsByTtpe(String menu,String type);
    //通过新闻ID查找新闻封面
    News findImgByNewsId(int nid);

    @Select("select * from news where menu = #{menu} order by views desc limit 4")
    List<News> findHomeNewsByMenuLimit(String menu);

    @Select("select * from news where menu = #{menu} and type = #{type} order by ntime desc")
    List<News> findHomeNewsByMenuType(@Param("menu") String menu,@Param("type") String type);

    @Select("select * from news where brief like #{search} or menu like #{search} or type like #{search} or title like #{search}")
    List<News> findNewsBySearch(String search);

    @Select("select * from notice order by otime desc ")
    List<Notice> findNotice();

    @Select("select * from notice where oid = #{oid} ")
    Notice findNoticeByOid(int oid);
}
