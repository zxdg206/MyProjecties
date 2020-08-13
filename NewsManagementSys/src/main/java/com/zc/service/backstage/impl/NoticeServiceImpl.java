package com.zc.service.backstage.impl;

import com.github.pagehelper.PageHelper;
import com.zc.dao.backstage.INoticeDao;
import com.zc.entity.Notice;
import com.zc.service.backstage.interf.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NoticeServiceImpl implements INoticeService {
    @Autowired
    INoticeDao dao;


    @Override
    public Notice findNoticeByOid(int oid) {
        return dao.findNoticeByOid(oid);
    }

    @Override
    public void delNoticeByOid(int oid) {
        dao.delNoticeByOid(oid);
    }

    @Override
    public List<Notice> findNoticeBySearch(int curpage,Notice notice) {
        PageHelper.startPage(curpage,15);
        return dao.findNoticeBySearch(notice);
    }

    @Override
    public List<Notice> findNotice(int curpage) {
        PageHelper.startPage(curpage,10);
        return dao.findNotice();
    }

    @Override
    public void addNotice(Notice notice) {
        dao.addNotice(notice);
    }
}
