package cn.itcast.mapper;

import java.util.List;

import cn.itcast.pojo.Reply;
import com.baomidou.mybatisplus.mapper.BaseMapper;


public interface ReplyMapper extends BaseMapper<Reply>{
	  public void addReply(Integer topicId);
	  public List<Reply> showReply(Reply topic);
	  
 
}
