package com.zc.dao.backstage;

import com.zc.entity.News;
import com.zc.entity.RollNews;
import com.zc.entity.TopNews;
import com.zc.utils.DaoProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.zc.entity.Comment;
import java.util.List;

@Repository()
public interface INewsDao {

    //添加新闻
    @Insert("insert into news(title,author,brief,content,menu,type,nsrc,nimg)values(#{title},#{author},#{brief},#{content},#{menu},#{type},#{nsrc},#{nimg})")
    @Options(useGeneratedKeys = true, keyProperty = "nid", keyColumn = "nid")
    void addNews(News news);

    //删除新闻
    @Delete("delete from news where nid=#{nid} ")
    void delNewsById(int nid);

    //查找全部新闻
    @Select("select * from news ")
    List<News> findAllNews();

    //添加新闻到RollNews
    @Insert("insert into rollnews(nid,title,nimg) values(#{nid},#{title},#{nimg})")
    void addRollNews(News news);

    //添加新闻到TopNews
    @Insert("insert into topnews(nid,title,nimg) values(#{nid},#{title},#{nimg})")
    void addTopNews(News news);

    //删除RollNews第一条记录
    @Delete("delete from rollnews limit 1 ")
    void delRollNewsFirst();

    //删除TopNews第一条记录
    @Delete("delete from topnews limit 1 ")
    void delTopNewsFirst();

    //移除滚动新闻
    @Delete("delete from rollnews where nid = #{nid}")
    void delRollNewsByRid(int nid);

    //移除右侧新闻
    @Delete("delete from topnews where nid = #{nid}")
    void delTopNewsByTid(int nid);

    //统计栏目新闻个数
    @Select("select count(*) from topnews ")
    Integer countTopnews();
    @Select("select count(*) from rollnews ")
    Integer countRollnews();

    //查找全部滚动新闻
    @Select("select * from rollnews order by rtime desc limit 6 ")
    List<RollNews> findRollNews();

    //查找全部右侧新闻
    @Select("select * from topnews order by ttime desc limit 4 ")
    List<TopNews> findTopNews();

    //根据条件查询全部新闻
    @SelectProvider(type= DaoProvider.class,method = "findAllNewsByCondition")
    List<News> findAllNewsByCondition(News all_news);

    //删除评论ByCid
    @Delete("delete from comment where cid = #{cid} ")
    Integer delCommentByCid(int cid);

    //查找Nid的全部评论
    @Select("select * from comment where nid = #{nid} order by ctime desc")
    List<Comment> findCommentOfNid(int nid);

    //查找news
    @Select("select * from news where nid = #{nid}")
    News findNewsByNid(int nid);

    //查找Roll新闻ByID
    @Select("select * from rollnews where nid = #{nid}")
    RollNews findRollNewsByNid(int nid);

    //查找Top新闻ByID
    @Select("select * from topnews where nid = #{nid}")
    TopNews findTopNewsByNid(int nid);

    //更新新闻
    @Update("update news set title = #{title},content = #{content},brief = #{brief},menu = #{menu},type = #{type},nsrc = #{nsrc},nimg = #{nimg} where nid = #{nid}")
    int updateNews(News news);

    //此处可以设置热门新闻个数
    @Select("select * from news order by views desc limit 4")
    List<News> findHotNews();

    //展示推荐新闻
    @Select("select * from news where menu = #{menu} and nid!=#{nid} order by views/(likes+1) asc limit 4")
    List<News> findRecommendNews(@Param("nid") int nid,@Param("menu")String menu);

    //更新浏览量
    @Update("update news set views = views+1 where nid = #{nid}")
    void updateViewsByNid(int nid);

    //更新评论量
    @Update("update news set comments = comments+1 where nid = #{nid}")
    void updateCommentsOfNid(int nid);
    @Update("update news set comments = comments-1 where nid = #{nid}")
    void delCommentsOfNid(int nid);

    //添加评论
    @Insert("insert into comment(nid,uname,uprofile,comment) values(#{nid},#{uname},#{uprofile},#{comment})")
    void addComment(Comment comment);


    @Select("select nid from comment where cid = #{cid}")
    int findNidByCidFromComment(int cid);


    @Update("update news set likes = likes+1 where nid = #{nid}")
    void updateLikesOfNews(Integer nid);

    @Select("select likes from news where nid = #{nid}")
    Integer getLikesOfNews(Integer nid);

    @SelectProvider(type= DaoProvider.class,method = "findAllNewsOfManageByCondition")
    List<News> findAllNewsOfManageByCondition(News all_news);
}
