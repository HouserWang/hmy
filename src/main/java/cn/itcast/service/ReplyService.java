package cn.itcast.service;


import cn.itcast.common.ReplyDTO;

public interface ReplyService {
	void addReply(Integer topicId);

	/**
	 * 回复帖子
	 * @param replyDTO 前端传递过来的参数封装
	 * @param userId 用户id
	 */
	boolean saveReply(ReplyDTO replyDTO, Integer userId);

	boolean dealLike(Integer topicId, Integer userId);
}
