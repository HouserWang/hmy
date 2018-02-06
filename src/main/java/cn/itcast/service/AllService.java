package cn.itcast.service;

import java.util.List;

import cn.itcast.pojo.*;
import cn.itcast.pojo.Model;
import cn.itcast.pojo.Topic;

public interface AllService {
	 List<Model> showModel();
	 
	 List<Topic> showTopic(Integer modelId);//模块划分帖子
	 List<Topic> showallTopic(); //首页板块所有帖子
	 User showUserByTopicId(Integer topicid);
	 User findUserById(String userId);
	 void postTopic(Topic Topic);
	 List<Notice> showNotice();
}
