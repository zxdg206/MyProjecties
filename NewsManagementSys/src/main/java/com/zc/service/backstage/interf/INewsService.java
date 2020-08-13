package com.zc.service.backstage.interf;

import com.zc.entity.*;

import java.util.List;

public interface INewsService {
    void addNews(News news);
    void delNewsById(int nid);
    List<News> findAllNews();
    //添加新闻到RollNews
    void addRollNews(News news);

    //添加新闻到TopNews
    void addTopNews(News news);

    void delRollNewsByRid(int rid);

    void delTopNewsByTid(int tid);

    List<RollNews> findRollNews();

    List<TopNews>findTopNews();

    List<News> findAllNewsByCondition(News all_news);

    int delCommentByCid(int cid);

    List<Comment> findCommentOfNid(int curpage,int nid);

    News findNewsByNid(int nid);

    int updateNews(News news);

    RollNews findRollNewsByNid(int nid);

    TopNews findTopNewsByNid(int nid);

    List<News> findHotNews();

    List<News> findRecommendNews(int nid,String menu);

    void updateViewsByNid(int nid);

    List<Comment> findCommentOfNidNoPage(int nid);

    void addComment(Comment comment);

    void updateLikesOfNews(Integer nid);

    Integer getLikesOfNews(Integer nid);

    public List<News> findAllNewsOfManageByCondition(News all_news);
}
