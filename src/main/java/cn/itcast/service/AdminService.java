package cn.itcast.service;

import cn.itcast.pojo.Topic;
import cn.itcast.pojo.User;
import com.baomidou.mybatisplus.plugins.Page;

public interface AdminService {
    Page<User> listUser(String userName, Page<User> page);
    boolean shutdownUser(Integer userId);
    boolean destroyUser(Integer userId);
    Page<Topic> listTopicsByUser(Integer userId, Page<Topic> page);
    boolean deleteTopic(Integer topicId);
    String getUserNameById(Integer userId);
}
