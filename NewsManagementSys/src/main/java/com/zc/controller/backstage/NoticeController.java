package com.zc.controller.backstage;


import com.github.pagehelper.PageInfo;
import com.zc.entity.Notice;
import com.zc.service.backstage.interf.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("notice")
public class NoticeController {
    @Autowired
    INoticeService service;

    //访问公告管理页面+搜索
    @RequestMapping("toNotice")
    public String toNotice(@RequestParam(name = "curpage",defaultValue = "1",required = true) Integer curpage, Notice notice, Model model){
        System.out.println("search是:"+notice.getSearch());
        model.addAttribute("search",notice.getSearch());
        String search = notice.getSearch();
        if(search!=null && !"".equals(search)) {
            notice.setSearch("%" + search  + "%");
        }
        List<Notice> noticeBySearch = service.findNoticeBySearch(curpage, notice);
        PageInfo pageInfo = new PageInfo(noticeBySearch,10);
        if(pageInfo.getNextPage()<=0){
            pageInfo.setNextPage(pageInfo.getPages());
        }
        model.addAttribute("pageInfo",pageInfo);
        return "backstage/admin-notice";
    }
    //查询公告详情
    @RequestMapping("findNotice")
    @ResponseBody
    public Object findNotice(Integer oid) {
        System.out.println("查询的公告详情ajax:"+oid);
        return service.findNoticeByOid(oid);
    }
    //批量删除公告
    @RequestMapping("delNoties")
    public String delNoties(HttpServletRequest request) {
        String[] res = request.getParameterValues("res");
        if(res==null){
            return "forward:/notice/toNotice";
        }
        for (String oid : res) {
            service.delNoticeByOid(Integer.parseInt(oid));
        }
        return "forward:/notice/toNotice";
    }
    //添加公告
    @RequestMapping("addNotice")
    public String addNotice( HttpServletRequest request, Notice notice){
        System.out.println("添加的Notice:"+notice);
        service.addNotice(notice);
        return "forward:/notice/toNotice";
    }
}
