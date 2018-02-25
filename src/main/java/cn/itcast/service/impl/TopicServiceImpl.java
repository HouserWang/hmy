package cn.itcast.service.impl;

import cn.itcast.common.ReplyVO;
import cn.itcast.mapper.TopicMapper;
import cn.itcast.pojo.*;
import cn.itcast.service.TopicService;
import cn.itcast.utils.Commons;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;

@Service
public class TopicServiceImpl implements TopicService {
    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
            .withZone(ZoneId.of("GMT+8"));

    @Resource
    private TopicMapper topicMapper;

    public void postTopic(Topic Topic) {
        topicMapper.postTopic(Topic);

    }


    public Topic showTopic(Integer topicid) {
        return topicMapper.showTopic(topicid);

    }

    public void deleteTopic(Topic Topic) {
        // TODO Auto-generated method stub

    }


    public List<Topic> fenye(String hql, int offset, int pagesize) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public Page<Topic> showMyTopic(Page<Topic> page, Integer userId) {

        return page.setRecords(topicMapper.showMyTopic(page, userId));
    }


    @Override
    public TopicExt findTopicAndUser(Integer topicId) {
        // TODO Auto-generated method stub
        Topic topic = new Topic().selectOne(new Condition().eq("topicId", topicId));
        User user = new User().selectOne(new Condition().eq("userId", topic.getUserId()));
        TopicExt topicExt = new TopicExt();
        topicExt.setContent(topic.getContent());
        topicExt.setTitle(topic.getTitle());
        topicExt.setUser(user);
        topicExt.setPostDate(topic.getPostDate());
        topicExt.setReplyCount(topic.getReplyCount());
        return topicExt;
    }

    @Override
    public List<ReplyVO> findReplies(Integer topicId) {
        List<Reply> replies = new Reply().selectList(new Condition().eq("topicId", topicId));
        List<ReplyVO> replyVOS = new ArrayList<>();

        for (int i = 1; i < replies.size() + 1; i++) {
            Reply reply = replies.get(i - 1);
            User user = new User().selectOne(new Condition().eq("userId", reply.getUserId()));
            ReplyVO replyVO = new ReplyVO();
            replyVO.setTopicId(reply.getTopicId());
            replyVO.setReplyTime(formatter.format(reply.getReplyTime().toInstant()));
            replyVO.setReplyContent(reply.getReplyContent());
            replyVO.setUserName(Optional.ofNullable(user).map(User::getUserName).orElse(""));
            replyVO.setSex(Optional.ofNullable(user).map(User::getUserSex).orElse(""));
            if (Objects.isNull(user) || StringUtils.isEmpty(user.getImageAddr())) {
                replyVO.setImageAttr(Commons.DEFAULT_PHOTO);
            } else {
                replyVO.setImageAttr(user.getImageAddr());
            }
            replyVO.setNumber(i);
            replyVOS.add(replyVO);
        }
        return replyVOS;
    }

    @Override
    public Integer findLikeCount(Integer topicId) {
        return new GiveLike().selectCount(new Condition().eq("topicId", topicId).eq("likeState", 1));
    }

    @Override
    public Page<Topic> showModelTopics(Page<Topic> page, Integer modelId) {
        return new Topic().selectPage(page, new Condition().eq("modelId", modelId));
    }

    @Override
    public Page<Topic> search(Page<Topic> page, String content) {
        List<Topic> records = topicMapper.search(content);
        return page.setRecords(records);
    }

    @Override
    public Page<Topic> findNewTopics(Page<Topic> page) {
        Date startDateTime = Date.from(Instant.now().minus(1, ChronoUnit.DAYS));
        return new Topic().selectPage(page, new Condition().gt("postDate", startDateTime));
    }

    @Override
    public Page<Topic> findHotTopics(Page<Topic> page) {
        return new Topic().selectPage(page, new Condition().gt("likeCount", 10).orderBy("likeCount"));
    }

}
