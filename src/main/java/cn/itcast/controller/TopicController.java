package cn.itcast.controller;

import cn.itcast.common.ReplyVO;
import cn.itcast.common.ResultVO;
import cn.itcast.pojo.Model;
import cn.itcast.pojo.Topic;
import cn.itcast.pojo.TopicExt;
import cn.itcast.service.ModelService;
import cn.itcast.service.TopicService;
import cn.itcast.utils.Commons;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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
    @Resource
    private ModelService modelService;

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
        Topic topic = new Topic();
        topic.setTitle(title);
        topic.setContent(content);
        topic.setModelId(modelId);
        topic.setUserId(userId);
        topic.setUserName(userName);
        topicService.postTopic(topic);
        return "test";

    }

    @RequestMapping("showLatestTopic")
    public String showLatestTopic(HttpServletRequest request) {

        return "test";

    }

    @RequestMapping("showTopicAndReply")
    public String showTopicAndReply(HttpServletRequest request) {
        Integer topicid = Integer.parseInt(request.getParameter("topicid"));
        TopicExt topicExt = topicService.findTopicAndUser(topicid);
        List<ReplyVO> replies = topicService.findReplies(topicid);
        Integer likeCount = topicService.findLikeCount(topicid);
        request.setAttribute("title", topicExt.getTitle());
        request.setAttribute("content", topicExt.getContent());
        request.setAttribute("postDate", topicExt.getPostDate());
        request.setAttribute("userSex", topicExt.getUser().getUserSex());
        request.setAttribute("userName", topicExt.getUser().getUserName());
        String imageAddr = topicExt.getUser().getImageAddr();
        if (StringUtils.isEmpty(imageAddr)) {
            imageAddr = Commons.DEFAULT_PHOTO;
        }
        request.setAttribute("imageAttr", imageAddr);
        request.setAttribute("replyCount", topicExt.getPostDate());
        request.setAttribute("replies", replies);
        request.setAttribute("topicId", topicid);
        request.setAttribute("likeCount", likeCount);

        return "post";

    }

    @RequestMapping("toNewPost")
    public String toNewPost(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        Integer userId = (Integer) session.getAttribute("userId");
        if (Objects.isNull(userId)) {
            return "login";
        }
        List<Model> modelList = modelService.showModel();
        request.setAttribute("modelList", modelList);
        return "publish_post";
    }

    @RequestMapping("showMyTopic")
    public String showMyTopic(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        Integer userId = (Integer) session.getAttribute("userId");
        Integer current = (Integer) request.getAttribute("current");
        Integer size = (Integer) request.getAttribute("size");
        Page<Topic> page = new Page<>(Objects.isNull(current) ? 1 : current, Objects.isNull(size) ? 10 : size);
        Page<Topic> pager = topicService.showMyTopic(page, userId);
        request.setAttribute("pager", pager);
        return "myPost";

    }

    @RequestMapping("findTopicAndUser")
    public String findTopicAndUser(HttpServletRequest request) {


        return "myPost";

    }

    @GetMapping("showModelPosts")
    public String showModelPosts(Integer modelId, String modelName, HttpServletRequest request) {
        Integer current = (Integer) request.getAttribute("current");
        Integer size = (Integer) request.getAttribute("size");
        Page<Topic> page = new Page<>(Objects.isNull(current) ? 1 : current, Objects.isNull(size) ? 10 : size);
        Page<Topic> pager = topicService.showModelTopics(page, modelId);
        request.setAttribute("pager", pager);
        request.setAttribute("modelName", modelName);
        return "allPosts";
    }

    @GetMapping("theNewTopic")
    public String theNewTopic(HttpServletRequest request){
        Integer current = (Integer) request.getAttribute("current");
        Integer size = (Integer) request.getAttribute("size");
        Page<Topic> page = new Page<>(Objects.isNull(current) ? 1 : current, Objects.isNull(size) ? 10 : size);
        Page<Topic> newTopics = topicService.findNewTopics(page);
        request.setAttribute("pager", newTopics);
        request.setAttribute("modelName", "近一天新帖");
        return "allPosts";
    }

    @GetMapping("theHotTopic")
    public String theHotTopic(HttpServletRequest request){
        Integer current = (Integer) request.getAttribute("current");
        Integer size = (Integer) request.getAttribute("size");
        Page<Topic> page = new Page<>(Objects.isNull(current) ? 1 : current, Objects.isNull(size) ? 10 : size);
        Page<Topic> hotTopics = topicService.findHotTopics(page);
        request.setAttribute("pager", hotTopics);
        request.setAttribute("modelName", "点赞数大于10的帖子");
        return "allPosts";
    }

}
