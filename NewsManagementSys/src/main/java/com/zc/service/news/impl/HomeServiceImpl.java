package com.zc.service.news.impl;


import com.github.pagehelper.PageHelper;
import com.zc.dao.news.IHomeDao;
import com.zc.entity.News;
import com.zc.entity.Notice;
import com.zc.service.news.interf.IHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeServiceImpl implements IHomeService {

    @Autowired
    IHomeDao dao;

    @Override
    public List<News> findHomeNewsByMenuLimit(String menu) {
        return dao.findHomeNewsByMenuLimit(menu);
    }

    @Override
    public List<News> findHomeNewsByMenuType(int curpage,String menu,String type) {
        PageHelper.startPage(curpage,10);
        return  dao.findHomeNewsByMenuType(menu,type);
    }

    @Override
    public List<News> findNewsBySearch(Integer curpage, String search) {
        PageHelper.startPage(curpage,10);
       return dao.findNewsBySearch(search);
    }

    @Override
    public List<Notice> findNotice(int curpage) {
        PageHelper.startPage(curpage,10);
        return dao.findNotice();
    }

    @Override
    public Notice findNoticeByOid(int oid) {
        return dao.findNoticeByOid(oid);
    }
}
