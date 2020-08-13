package com.zc.service.news.interf;


import com.zc.entity.News;
import com.zc.entity.Notice;

import java.util.List;

public interface IHomeService {

   List<News> findHomeNewsByMenuLimit(String menu);

   List<News> findHomeNewsByMenuType(int curpage,String menu,String type);

   List<News> findNewsBySearch(Integer curpage, String search);

    List<Notice> findNotice(int curpage);

    Notice findNoticeByOid(int oid);
}
