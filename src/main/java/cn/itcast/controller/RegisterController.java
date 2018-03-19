package cn.itcast.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class RegisterController {
     @RequestMapping("success")
     //输入success.do进入注册界面
	 public String register(){
		return "register";
		 
	 }
     
     @RequestMapping("login")
     //输入login.do进入登录界面
	 public String login(){
		System.out.println("success login jsp");
		return "login";
		 
	 }
     
     @RequestMapping("emailLogin")
	 public String emailLogin(){
		System.out.println("success login email jsp");
		return "emailLogin";
		 
	 }
     @RequestMapping("photo")
	 public String photo(HttpServletRequest request,HttpServletResponse response){
		System.out.println("success photo jsp");
		try {
			 HttpSession session=request.getSession(true);
	    	  OutputStream os=response.getOutputStream();
			  os.write((byte[])session.getAttribute("imageAddr"));
			  os.close();
			  
		 } catch (IOException e) {
			 e.printStackTrace();
		}
		/*try{
			 HttpSession session=request.getSession(true);
		     OutputStream output = response.getOutputStream();  
			 InputStream in = new ByteArrayInputStream((byte[])session.getAttribute("imageAddr"));  
			 int len;  
			 byte[] buf = new byte[1024];  
			 while ((len = in.read(buf)) != -1) {  
			    output.write(buf, 0, len);  
			 }  
			   
		}catch(Exception e){
			System.out.println(e);
		}*/
		 
		return "photo";
		 
	 }
 }
	 
 
 
	 
 