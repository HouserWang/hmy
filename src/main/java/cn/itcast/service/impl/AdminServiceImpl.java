package cn.itcast.service.impl;

import cn.itcast.mapper.UserMapper;
import cn.itcast.pojo.Reply;
import cn.itcast.pojo.Topic;
import cn.itcast.pojo.User;
import cn.itcast.service.AdminService;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    private UserMapper userMapper;

    public Page<User> listUser(String userName, Page<User> page) {
        if (Objects.isNull(userName)) {
            return new User().selectPage(page, null);
        }
        return new User().selectPage(page, new Condition().like("%userName%", userName));
    }

    public boolean shutdownUser(Integer userId) {
        User user2 = new User();
        user2.setIfPostTopic(0);
        user2.setUserId(userId);
        userMapper.updateUser(user2);
        return true;
    }

    public boolean destroyUser(Integer userId) {
        userMapper.deleteUser(userId);
        List<Topic> topics = new Topic().selectList(new Condition().eq("userId", userId));
        topics.forEach(a -> {
            userMapper.deleteTopic(a.getTopicId());
        });
        List<Reply> replies = new Reply().selectList(new Condition().eq("userId", userId));
        replies.forEach(a -> {
            userMapper.deleteReply(a.getReplyId());
        });
        return true;
    }

    public Page<Topic> listTopicsByUser(Integer userId, Page<Topic> page) {
        return new Topic().selectPage(page, new Condition().eq("userId", userId));
    }
    public String getUserNameById(Integer userId){
        return new User().selectOne(new Condition().eq("userId",userId)).getUserName();
    }
    public boolean deleteTopic(Integer topicId) {
        userMapper.deleteTopic(topicId);
        return true;
    }
}
