package cn.itcast.controller;

import cn.itcast.common.ReplyDTO;
import cn.itcast.common.ResultVO;
import cn.itcast.service.ReplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;


@Controller()
public class ReplyController {
    @Resource
    private ReplyService replyService;
    
    /*@RequestMapping("postTopic")
	 public String postTopic(HttpServletRequest request){
    	String title=request.getParameter("title");
    	String content=request.getParameter("content"); 
    	Integer modelId=Integer.parseInt(request.getParameter("change"));
    	 HttpSession session=request.getSession(true);
    	String userName=(String) session.getAttribute("userName");
		Topic Topic=new Topic();
		Topic.setTitle(title);Topic.setContent(content);Topic.setModelId(modelId);Topic.setUserId(userId);
		topicservice.postTopic(Topic);
    	return "test"; 
    	 
	 }
 */

    @PostMapping("reply")
    @ResponseBody
    public ResultVO reply(ReplyDTO replyDTO, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        Integer userId = (Integer) session.getAttribute("userId");
        if (Objects.isNull(userId)) {
            return ResultVO.error("请先登陆");
        }
        boolean reply = replyService.saveReply(replyDTO, userId);
        if (reply) {
            return ResultVO.success("回复成功");
        } else {
            return ResultVO.error("回复失败");
        }
    }

    @PostMapping("/giveLike")
    @ResponseBody
    public ResultVO giveLike(Integer topicId, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        Integer userId = (Integer) session.getAttribute("userId");
        if (Objects.isNull(userId)) {
            return ResultVO.error("请先登陆");
        }
        boolean like = replyService.dealLike(topicId, userId);
        if (like) {
            return ResultVO.success("点赞成功");
        } else {
            return ResultVO.error("点赞失败");
        }
    }

    @RequestMapping(value = "showReply", method = RequestMethod.GET)
    public String showReply(HttpServletRequest request) {
        return "test";


    }


}
