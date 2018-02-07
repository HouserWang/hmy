package cn.itcast.controller;

import cn.itcast.common.ReplyVO;
import cn.itcast.pojo.Reply;
import cn.itcast.pojo.Topic;
import cn.itcast.pojo.TopicExt;
import cn.itcast.service.TopicService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller

public class TopicController {
    @Resource
    private TopicService topicService;

    /*@RequestMapping("postTopic")
	 public String postTopic(HttpServletRequest request){
    	String title=request.getParameter("title");
    	String content=request.getParameter("content"); 
    	Integer modelId=Integer.parseInt(request.getParameter("change"));
    	 HttpSession session=request.getSession(true);
    	String userName=(String) session.getAttribute("userName");
		Topic Topic=new Topic();
		Topic.setTitle(title);Topic.setContent(content);Topic.setModelId(modelId);Topic.setUserId(userId);
		topicService.postTopic(Topic);
    	return "test"; 
    	 
	 }
 */
    @RequestMapping("postTopic")
    public String postTopic(HttpServletRequest request) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Integer modelId = Integer.parseInt(request.getParameter("change"));
        HttpSession session = request.getSession(true);
        String userName = (String) session.getAttribute("userName");
        Integer userId = (Integer) session.getAttribute("userId");
        Topic Topic = new Topic();
        Topic.setTitle(title);
        Topic.setContent(content);
        Topic.setModelId(modelId);
        Topic.setUserId(userId);
        topicService.postTopic(Topic);
        return "test";

    }

    @RequestMapping("showLatestTopic")
    public String showLatestTopic(HttpServletRequest request) {

        return "test";

    }

    @RequestMapping("showTopicAndReply")
    public String showTopicAndReply(HttpServletRequest request) {
        Integer topicid = Integer.parseInt(request.getParameter("topicid"));
        TopicExt topicext = topicService.findTopicAndUser(topicid);
        List<ReplyVO> replies = topicService.findReplies(topicid);
        request.setAttribute("title", topicext.getTitle());
        request.setAttribute("content", topicext.getContent());
        request.setAttribute("postDate", topicext.getPostDate());
        request.setAttribute("userSex", topicext.getUser().getUserSex());
        request.setAttribute("userName", topicext.getUser().getUserName());
        request.setAttribute("replyCount", topicext.getPostDate());
        request.setAttribute("replies",replies);
        request.setAttribute("topicId",topicid);

        return "post";

    }

    @RequestMapping("showMyTopic")
    public String showMyTopic(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        Integer userId = (Integer) session.getAttribute("userId");
        List<Topic> mytopicList = (List<Topic>) topicService.showMyTopic(userId);
        session.setAttribute("mytopicList", mytopicList);
        return "myPost";

    }

    @RequestMapping("findTopicAndUser")
    public String findTopicAndUser(HttpServletRequest request) {


        return "myPost";

    } 
/*
	@PostMapping("handleLike")
    public ResultVO handleLike(){
	}
     */
}
