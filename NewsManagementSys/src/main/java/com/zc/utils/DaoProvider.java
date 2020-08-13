package com.zc.utils;

import com.zc.entity.News;
import com.zc.entity.Notice;
import com.zc.entity.User;

/**
 * 提供动态查询的方法
 */
public class DaoProvider {

    public String findAllUserByCondition(User pc) {
        String info = pc.getUinfo();
        String sql = "SELECT * FROM user where 1=1 ";
        if(info!=null && !"".equals(info)){
            sql += " and uname like #{uinfo} or uphone like #{uinfo} or uemail like #{uinfo} or uid like #{uinfo} or uidentity like #{uinfo} or usex like #{uinfo}";
        }
        sql += " order by uid desc";
        return sql;
    }

    public String findAllNewsByCondition(News news) {
        String search = news.getSearch();
        String sql = "SELECT * FROM news where 1=1 ";
        if(search!=null && !"%%".equals(search)){
            sql += " and title like #{search} or nid like #{search} or author like #{search} or menu like #{search} " +
                    "or type like #{search}";
        }
        sql += " order by ntime desc";
        System.out.println("root的sql："+sql);
        return sql;
    }

    public String findNoticeBySearch(Notice notice){
        String search = notice.getSearch();
        String sql = "SELECT * FROM notice where 1=1 ";
        if(search!=null && !"%%".equals(search)){
            sql += " and otitle like #{search}";
        }
        sql += " order by oid desc";
        return sql;
    }
    public String findAllNewsOfManageByCondition(News news) {
        String search = news.getSearch();
        System.out.println("刷新的search是："+search);
        String sql = "SELECT * FROM news where author = #{author} ";
        if(search!=null && !"".equals(search) && !"%%".equals(search)){
            sql += " and (title like #{search} or nid like #{search} or menu like #{search} or type like #{search})";
        }
        sql += " order by ntime desc";
        System.out.println("root的新闻管理员："+sql);
        return sql;
    }

}
