package cn.itcast.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import cn.itcast.pojo.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.service.ModelService;


@Controller
 
public class ModelController {
    @Resource
    private ModelService modelservice;
    //添加模块
    @RequestMapping("addmodel")
	 public String addmodel(HttpServletRequest request){
		 String modelName=request.getParameter("modelName");
		 Model Model =new Model();
		 Model.setModelName(modelName);
		 Model model1=modelservice.checkModel(modelName);
        if(model1!=null)
        {
        	//已经存在
       	 return "pageMessage";//警告界面
        }
        else {
        	modelservice.addModel(Model);
       	 return "create_model";
        } 
	 }
      
    //显示模块
    @RequestMapping("showmodel")
	 public String showmodel(HttpServletRequest request){
    	List<Model> modelList=(List<Model>) modelservice.showModel();
        HttpSession session=request.getSession(true); 
	    session.setAttribute("modelList", modelList);
	   // HttpServletRequest request = ServletActionContext.getRequest();
	    
    	return "index";
     }
     
	 
    
    
     
}
