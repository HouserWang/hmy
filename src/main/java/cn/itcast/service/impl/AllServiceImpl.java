package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import cn.itcast.pojo.Model;
import cn.itcast.pojo.User;
import org.springframework.stereotype.Service;

import cn.itcast.mapper.ModelMapper;
import cn.itcast.mapper.NoticeMapper;
import cn.itcast.mapper.TopicMapper;
import cn.itcast.mapper.UserMapper;
import cn.itcast.pojo.Notice;
import cn.itcast.pojo.Topic;
import cn.itcast.service.AllService;
@Service
public class AllServiceImpl implements AllService {
     //注意：这个地方一个注解相当于将一个serveice注入  不可公用一个注解

	@Resource
	private ModelMapper modelmapper;
	@Resource
	private TopicMapper topicmapper;
	@Resource
	private UserMapper usermapper;
	@Resource
	private NoticeMapper noticemapper;
	public List<Model> showModel() {
	 
		return modelmapper.showModel();
	}

	 
	 


	@Override
	public List<Topic> showTopic(Integer modelId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Topic> showallTopic() {
		// TODO Auto-generated method stub
		 
		return  topicmapper.showallTopic();
	}


	@Override
	public User showUserByTopicId(Integer topicid) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public User findUserById(String userId) {
		// TODO Auto-generated method stub
		return  usermapper.findUserById(userId);
	}


	@Override
	public void postTopic(Topic Topic) {
		// TODO Auto-generated method stub
		topicmapper.postTopic(Topic);
	}


	@Override
	public List<Notice> showNotice() {
		// TODO Auto-generated method stub
		 
		return noticemapper.showNotice();
	}


 
}
