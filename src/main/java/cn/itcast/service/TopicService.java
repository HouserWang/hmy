package cn.itcast.service;

import cn.itcast.common.ReplyVO;
import cn.itcast.pojo.Topic;
import cn.itcast.pojo.TopicExt;

import java.util.List;


public interface TopicService {
    void postTopic(Topic Topic);

    Topic showTopic(Integer topicid);

    List<Topic> showMyTopic(String userId);//个人帖子查询集合

    TopicExt findTopicAndUser(Integer topicId);//个人帖子查询集合

    void deleteTopic(Topic Topic);

    List<Topic> fenye(String hql, int offset, int pagesize);

    List<ReplyVO> findReplies(Integer topicId);
}
