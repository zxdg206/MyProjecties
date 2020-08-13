package com.zc.service.backstage.interf;


import com.zc.entity.Notice;

import java.util.List;

public interface INoticeService {

    Notice findNoticeByOid(int oid);
    void delNoticeByOid(int oid);
    List<Notice> findNoticeBySearch(int curpage,Notice notice);
    List<Notice> findNotice(int curpage);

    void addNotice(Notice notice);
}
