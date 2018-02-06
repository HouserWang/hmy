package cn.itcast.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import cn.itcast.pojo.Model;
import cn.itcast.pojo.Topic;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.pojo.Notice;
import cn.itcast.service.AllService;


@Controller
 
public class AllIndexController {
    @Resource
    private AllService allservice;
     
	 @RequestMapping("allIndex")
	 public String allIndex(HttpServletRequest request){
		  
		 List<Model> modelList=(List<Model>) allservice.showModel();
		 
		 List<Topic> topicList=(List<Topic>) allservice.showallTopic();
		 
		 List<Notice> noticeList=(List<Notice>) allservice.showNotice();
		 // HttpSession session=request.getSession(true); 
		 request.setAttribute("modelList", modelList);
		 request.setAttribute("topiclist", topicList);
		 request.setAttribute("noticeList", noticeList);
		 request.setAttribute("T_flag", "123");
		 return "index";
	   }	 
	 
 
    
    
     
}
