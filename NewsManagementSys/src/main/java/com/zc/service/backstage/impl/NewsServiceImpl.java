package com.zc.service.backstage.impl;

import com.github.pagehelper.PageHelper;
import com.zc.dao.backstage.INewsDao;
import com.zc.entity.*;
import com.zc.service.backstage.interf.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements INewsService {
    @Autowired
    INewsDao dao;


    @Override
    public void addNews(News news) {
        //不进行新闻重复检测
        dao.addNews(news);
    }

    @Override
    public void delNewsById(int nid) {
        dao.delNewsById(nid);
    }

    @Override
    public List<News> findAllNews() {
        return null;
    }

    //添加滚动新闻
    @Override
    public void addRollNews(News news) {
        Integer i = dao.countRollnews();
        if(i>10){
            dao.delRollNewsFirst();
        }
        dao.addRollNews(news);
    }

    //添加头条新闻
    @Override
    public void addTopNews(News news) {
        //重复新闻的判断
        Integer i = dao.countTopnews();
        if(i>10){
            dao.delTopNewsFirst();
        }
        dao.addTopNews(news);
    }


    @Override
    public void delRollNewsByRid(int rid) {
        dao.delRollNewsByRid(rid);
    }

    @Override
    public void delTopNewsByTid(int tid) {
        dao.delTopNewsByTid(tid);
    }

    @Override
    public List<RollNews> findRollNews() {
        return dao.findRollNews();
    }

    @Override
    public List<TopNews> findTopNews() {
        return dao.findTopNews();
    }

    @Override
    public List<News> findAllNewsByCondition(News all_news) {
        PageHelper.startPage(all_news.getCurpage(),all_news.getPagesize());
        List<News> allNewsByCondition = dao.findAllNewsByCondition(all_news);
        return allNewsByCondition;
    }

    @Override
    public int delCommentByCid(int cid) {
        //合法验证，应该查找是否存在此评论，不存在返回0，删除成功返回1，失败返回-1;
        int nid = dao.findNidByCidFromComment(cid);
        dao.delCommentsOfNid(nid);
        return dao.delCommentByCid(cid);
    }

    @Override
    public List<Comment> findCommentOfNid(int curpage,int nid) {
        PageHelper.startPage(curpage,5);
        return dao.findCommentOfNid(nid);
    }

    @Override
    public News findNewsByNid(int nid) {
        News newsByNid = dao.findNewsByNid(nid);
        //写入栏位信息
        if (dao.findRollNewsByNid(nid)!=null){
            System.out.println("Nid:"+nid+"是RollNews");
            newsByNid.setRollnews("yes");
        }
        if (dao.findTopNewsByNid(nid)!=null){
            System.out.println("Nid:"+nid+"是TopNews");
            newsByNid.setTopnews("yes");
        }
        return newsByNid;
    }

    @Override
    public int updateNews(News news) {
       return dao.updateNews(news);
    }

    @Override
    public RollNews findRollNewsByNid(int nid) {
        return dao.findRollNewsByNid(nid);
    }

    @Override
    public TopNews findTopNewsByNid(int nid) {
        return dao.findTopNewsByNid(nid);
    }

    @Override
    public List<News> findHotNews() {
        return dao.findHotNews();
    }


    @Override
    public List<News> findRecommendNews(int nid,String menu) {
        return dao.findRecommendNews(nid,menu);
    }

    @Override
    public void updateViewsByNid(int nid) {
        dao.updateViewsByNid(nid);
    }

    @Override
    public List<Comment> findCommentOfNidNoPage(int nid) {
       return dao.findCommentOfNid(nid);
    }

    //添加评论
    @Override
    public void addComment(Comment comment) {
        dao.updateCommentsOfNid(comment.getNid());
        dao.addComment(comment);
    }

    @Override
    public void updateLikesOfNews(Integer nid) {
       dao.updateLikesOfNews(nid);
    }

    @Override
    public Integer getLikesOfNews(Integer nid) {
        return dao.getLikesOfNews(nid);
    }

    @Override
    public List<News> findAllNewsOfManageByCondition(News all_news) {
        PageHelper.startPage(all_news.getCurpage(),all_news.getPagesize());
        return dao.findAllNewsOfManageByCondition(all_news);
    }
}
