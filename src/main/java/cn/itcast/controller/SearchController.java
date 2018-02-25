package cn.itcast.controller;

import cn.itcast.pojo.Topic;
import cn.itcast.service.TopicService;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Controller
public class SearchController {
    @Resource
    private TopicService topicService;

    @GetMapping("search")
    public String search(String content, HttpServletRequest request) {
        Integer current = (Integer) request.getAttribute("current");
        Integer size = (Integer) request.getAttribute("size");
        Page<Topic> pageParam = new Page<>(Objects.isNull(current) ? 1 : current, Objects.isNull(size) ? 10 : size);
        Page<Topic> pager = topicService.search(pageParam, content);
        request.setAttribute("pager", pager);
        return "allPosts";
    }
}
