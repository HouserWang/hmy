package cn.itcast.service.impl;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import cn.itcast.common.ReplyVO;
import cn.itcast.pojo.*;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Service;

import cn.itcast.mapper.TopicMapper;
import cn.itcast.service.TopicService;
@Service
public class TopicServiceImpl implements TopicService {
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
														   .withZone(ZoneId.of("GMT+8"));

	@Resource
	private TopicMapper topicmapper;
	public void postTopic(Topic Topic) {
		topicmapper.postTopic(Topic);

	}

	 
	public Topic showTopic(Integer topicid) {
		return topicmapper.showTopic(topicid);
		 
	}
 
	public void deleteTopic(Topic Topic) {
		// TODO Auto-generated method stub

	}

	 
	public List<Topic> fenye(String hql, int offset, int pagesize) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Page<Topic> showMyTopic(Page<Topic> page , Integer userId) {
		 
		return page.setRecords(topicmapper.showMyTopic(page,userId));
	}


	@Override
	public TopicExt findTopicAndUser(Integer topicId) {
		// TODO Auto-generated method stub
		return topicmapper.findTopicAndUser(topicId);
	}

	@Override
	public List<ReplyVO> findReplies(Integer topicId){
		List<Reply> replies = new Reply().selectList(new Condition().eq("topicId", topicId));
		List<ReplyVO> collect = replies.stream().map(reply -> {
			User user = new User().selectOne(new Condition().eq("userId", reply.getUserId()));
			ReplyVO replyVO = new ReplyVO();
			replyVO.setTopicId(reply.getTopicId());
			replyVO.setReplyTime(formatter.format(reply.getReplyTime().toInstant()));
			replyVO.setReplyContent(reply.getReplyContent());
			replyVO.setUserName(Optional.ofNullable(user).map(User::getUserName).orElse(""));
			replyVO.setSex(Optional.ofNullable(user).map(User::getUserSex).orElse(""));
			return replyVO;
		}).collect(Collectors.toList());
		return collect;
	}

	@Override
	public Integer findLikeCount(Integer topicId){
		return new GiveLike().selectCount(new Condition().eq("topicId",topicId).eq("likeState",1));
	}

	@Override
	public Page<Topic> showModelTopics(Page<Topic> page , Integer modelId){
		return new Topic().selectPage(page, new Condition().eq("modelId",modelId));
	}

}
