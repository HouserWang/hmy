package cn.itcast.controller;

import java.io.IOException;
import java.util.Objects;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cn.itcast.common.ResultVO;
import cn.itcast.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.itcast.service.UserService;


@Controller
public class UserController {
    @Resource
    private UserService UserService;


    @PostMapping("login")
    @ResponseBody
    public ResultVO login(HttpServletRequest request) {
        String email = request.getParameter("email");
        String userPassword = request.getParameter("userPassword");
        if(StringUtils.isEmpty(email) || StringUtils.isEmpty(userPassword)){
            return ResultVO.error("请输入账号密码");
        }
        if(!UserService.checkEmail(email)){
            return ResultVO.error("账号不存在");
        }
        if(!Objects.equals(UserService.checkPwd(email),userPassword)){
            return ResultVO.error("密码错误");
        }
        User User = UserService.findUserByEmail(email);
        String userName = User.getUserName();
        String userSex = User.getUserSex();
        Integer userId = User.getUserId();
        String role = User.getRole().toString();
        HttpSession session = request.getSession(true);
        session.setAttribute("imageAddr", User.getImageAddr());
        session.setAttribute("userId", userId);
        session.setAttribute("userName", userName);
        session.setAttribute("userSex", userSex);
        session.setAttribute("role2", role);

        session.setAttribute("email", email);
        session.setAttribute("userPassword", userPassword);
        return ResultVO.success("登陆成功");
    }

    @RequestMapping("emailloginsuccess")
    public String emailloginsuccess(HttpServletRequest request) {
        String email = request.getParameter("email");
        User User = UserService.findUserByEmail(email);
        String userName = User.getUserName();
        HttpSession session = request.getSession(true);
        session.setAttribute("userName", userName);
        if (UserService.checkEmail(email)) {

            return "index";
        } else {return "register";}

    }

    @RequestMapping("addUser")
    public String addUser(HttpServletRequest request) {
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        User User = new User();
        User.setEmail(email);
        User.setUserName(userName);
        User.setUserPassword(userPassword);
        if (UserService.checkEmail(email)) {
            System.out.println("邮箱已注册！请直接登陆！");
            return "test";

        } else {
            UserService.addUser(User);
            System.out.println("注册成功，请登陆！");
            return "test";
        }
    }


    @RequestMapping("exit")
    public String exit(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        session.invalidate();
        return "redirect:/allIndex";

    }

    @RequestMapping("setInfo")
    public String setInfo() {

        return null;

    }

    //信息修改后需要重新登陆
    @RequestMapping("updateUser")
    public String userchange(@RequestParam(value = "imageAddr") MultipartFile imageAddr, HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
        HttpSession session = request.getSession(true);
        //String path="F:\\java\\apache-tomcat-7.0.57\\webapps\\pic";
        String path = request.getSession().getServletContext().getRealPath("/");
        System.out.println(path);
        String fileName = imageAddr.getOriginalFilename();
        String newFileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
        java.io.File file = new java.io.File(path, newFileName);
        if (!file.exists()) {
            file.mkdirs();
        }
        imageAddr.transferTo(file);
        System.out.println(path);
        Integer userid = (Integer) session.getAttribute("userId");
        String email = request.getParameter("email");
        String userSex = request.getParameter("userSex");
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");

        User User = new User();
        User.setUserId(userid);
        User.setEmail(email);
        User.setUserName(userName);
        User.setUserPassword(userPassword);
        User.setUserSex(userSex);

        User.setImageAddr(newFileName);
        UserService.updateUser(User);
        System.out.println(User.getUserName());
        session.removeAttribute("userName");
        String username = (String) session.getAttribute("userName");
        System.out.println(username);

        return "test";

    }


}
