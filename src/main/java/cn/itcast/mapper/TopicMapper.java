package cn.itcast.mapper;

import java.util.List;

import cn.itcast.pojo.Topic;
import cn.itcast.pojo.TopicExt;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;


public interface TopicMapper extends BaseMapper<Topic>{
	 public void postTopic(Topic Topic);
	 public List<Topic> showallTopic();//所有帖子，公共区
	 public Topic showTopic(Integer topicid);
	 public List<Topic> showMyTopic(Page<Topic> page ,Integer userId);//所有帖子，公共区
	 public void deleteTopic(Topic Topic);
	 public List<Topic> fenye(String hql, int offset, int pagesize);
	 public TopicExt findTopicAndUser(Integer topicId);
	 void incReplyCount(Integer topicId);
	 List<Topic> search(String content);
}
