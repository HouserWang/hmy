package cn.itcast.service.impl;

import cn.itcast.common.ReplyDTO;
import cn.itcast.mapper.ReplyMapper;
import cn.itcast.mapper.TopicMapper;
import cn.itcast.pojo.GiveLike;
import cn.itcast.pojo.Reply;
import cn.itcast.pojo.Topic;
import cn.itcast.service.ReplyService;
import com.baomidou.mybatisplus.mapper.Condition;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.util.Objects;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Resource
    private ReplyMapper replyMapper;

    @Resource
    private TopicMapper topicMapper;

    @Override
    public void addReply(Integer topicId) {
        replyMapper.addReply(topicId);

    }

    /**
     * 回复帖子
     *
     * @param replyDTO 前端传递过来的参数封装
     * @param userId   用户id
     */
    @Override
    public boolean saveReply(ReplyDTO replyDTO, Integer userId) {
        Assert.notNull(replyDTO, "replyDTO can not be null");
        Assert.hasLength(replyDTO.getContent(), "content不能为空");
        Assert.notNull(replyDTO.getTopicId(), "topicId不能为空");


        Reply reply = new Reply();
        reply.setTopicId(replyDTO.getTopicId());
        reply.setReplyContent(replyDTO.getContent());
        reply.setUserId(userId);
        boolean isTrue = reply.insert();
        //帖子数量加1
        topicMapper.incReplyCount(replyDTO.getTopicId());
        return isTrue;
    }

    public boolean dealLike(Integer topicId, Integer userId) {
        GiveLike giveLike = new GiveLike().selectOne(new Condition().eq("topicId", topicId).eq("userId", userId));
        //无记录直接插入，默认点赞状态
        if (Objects.isNull(giveLike)) {
            GiveLike insertLike = new GiveLike();
            insertLike.setTopicId(topicId);
            insertLike.setUserId(userId);
            return insertLike.insert();
        }
        GiveLike updateLike = new GiveLike();
        updateLike.setId(giveLike.getId());
        if (Objects.equals(giveLike.getLikeState(), 1)) {
            updateLike.setLikeState(0);
            return updateLike.updateById();
        } else {
            updateLike.setLikeState(1);
            return updateLike.updateById();
        }


    }

}
