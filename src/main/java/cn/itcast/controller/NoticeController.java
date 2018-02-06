package cn.itcast.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.pojo.Notice;
import cn.itcast.service.NoticeService;


@Controller
 
public class NoticeController {
    @Resource
    private NoticeService noticeservice;
    
    @RequestMapping("addNotice")
	 public String addNotice(HttpServletRequest request){
		String noticeMan=request.getParameter("noticeMan");
		String notice=request.getParameter("Notice");
		Notice not=new Notice();
		not.setNotice(notice);not.setNoticeMan(noticeMan);
		noticeservice.addNotice(not);
    	return "test";
    
    
    }
}
