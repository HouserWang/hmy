package cn.itcast.controller;

import cn.itcast.common.ReplyVO;
import cn.itcast.pojo.Reply;
import cn.itcast.pojo.Topic;
import cn.itcast.pojo.TopicExt;
import cn.itcast.service.TopicService;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;


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
        Integer likeCount = topicService.findLikeCount(topicid);
        request.setAttribute("title", topicext.getTitle());
        request.setAttribute("content", topicext.getContent());
        request.setAttribute("postDate", topicext.getPostDate());
        request.setAttribute("userSex", topicext.getUser().getUserSex());
        request.setAttribute("userName", topicext.getUser().getUserName());
        request.setAttribute("replyCount", topicext.getPostDate());
        request.setAttribute("replies", replies);
        request.setAttribute("topicId", topicid);
        request.setAttribute("likeCount", likeCount);

        return "post";

    }

    @RequestMapping("showMyTopic")
    public String showMyTopic(HttpServletRequest request) {
        //HttpSession session = request.getSession(true);
        //Integer userId = (Integer) session.getAttribute("userId");
//        分页
        Integer current = (Integer) request.getAttribute("current");
        Integer size = (Integer) request.getAttribute("size");
        Page<Topic> page = new Page<>(Objects.isNull(current) ? 1 : current, Objects.isNull(size) ? 10 : size);
        Page<Topic> pager = topicService.showMyTopic(page, 1);
        request.setAttribute("pager", pager);
        return "myPost";

    }

    @RequestMapping("findTopicAndUser")
    public String findTopicAndUser(HttpServletRequest request) {


        return "myPost";

    }

    @GetMapping("showModelPosts")
    public String showModelPosts(Integer modelId,String modelName, HttpServletRequest request) {
        Integer current = (Integer) request.getAttribute("current");
        Integer size = (Integer) request.getAttribute("size");
        Page<Topic> page = new Page<>(Objects.isNull(current) ? 1 : current, Objects.isNull(size) ? 10 : size);
        Page<Topic> pager = topicService.showModelTopics(page, modelId);
        request.setAttribute("pager", pager);
        request.setAttribute("modelName", modelName);
        return "allPosts";
    }

}
