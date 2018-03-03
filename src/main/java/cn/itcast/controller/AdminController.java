package cn.itcast.controller;

import cn.itcast.common.ResultVO;
import cn.itcast.pojo.Topic;
import cn.itcast.pojo.User;
import cn.itcast.service.AdminService;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Controller
public class AdminController extends BaseController<User> {
    @Resource
    private AdminService adminService;

    @GetMapping("listUsers")
    public String listUsers(String userName, HttpServletRequest request) {
        Page<User> pager = adminService.listUser(userName, newPage(request));
        request.setAttribute("pager", pager);
        return "admin";
    }

    @PostMapping("shutdownUser")
    @ResponseBody
    public ResultVO shutdownUser(Integer userId, HttpServletRequest request) {
        boolean flag = adminService.shutdownUser(userId);
        if (flag) {
            return ResultVO.success("封锁成功");
        } else {
            return ResultVO.error("封锁失败");
        }
    }

    @PostMapping("destroyUser")
    @ResponseBody
    public ResultVO destroyUser(Integer userId, HttpServletRequest request) {
        boolean flag = adminService.destroyUser(userId);
        if (flag) {
            return ResultVO.success("注销成功");
        } else {
            return ResultVO.error("注销失败");
        }
    }

    @GetMapping("toUserPosts")
    public String toUserPosts(Integer userId, HttpServletRequest request){
        String current = request.getParameter("current");
        String size = request.getParameter("size");
        Page<Topic> topicPage = new Page<>(Objects.isNull(current) ? 1 : Integer.parseInt(current), Objects.isNull(size) ? 10 : Integer.parseInt(size));
        Page<Topic> pager = adminService.listTopicsByUser(userId, topicPage);
        String userName = adminService.getUserNameById(userId);
        request.setAttribute("pager",pager);
        request.setAttribute("userName",userName);
        request.setAttribute("userId",userId);
        return "userPosts";
    }

    @PostMapping("deleteTopic")
    @ResponseBody
    public ResultVO deleteTopic(Integer topicId, HttpServletRequest request){
        boolean flag = adminService.deleteTopic(topicId);
        if (flag) {
            return ResultVO.success("删除成功");
        } else {
            return ResultVO.error("删除失败");
        }
    }

}
