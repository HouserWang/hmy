package cn.itcast.controller;

import cn.itcast.common.ReplyDTO;
import cn.itcast.common.ResultVO;
import cn.itcast.service.ReplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;


@Controller()
@RequestMapping("topic")
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

    @PostMapping("/reply")
    public ResultVO reply(ReplyDTO replyDTO, @SessionAttribute Integer userId) {
        if (Objects.isNull(userId)) {
            return ResultVO.error("请先登陆");
        }
        boolean reply = replyService.saveReply(replyDTO, 0);
        if (reply) {
            return ResultVO.success("回复成功");
        } else {
            return ResultVO.error("回复失败");
        }
    }

    @PostMapping("/giveLike")
    public ResultVO giveLike(Integer topicId, @SessionAttribute Integer userId) {
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
