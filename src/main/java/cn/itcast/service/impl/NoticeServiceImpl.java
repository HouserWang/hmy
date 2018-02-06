package cn.itcast.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.itcast.mapper.NoticeMapper;
import cn.itcast.pojo.Notice;
import cn.itcast.service.NoticeService;
@Service
public class NoticeServiceImpl implements NoticeService {
   
	@Resource
	private NoticeMapper noticemapper;

	@Override
	public void addNotice(Notice Notice) {
		noticemapper.addNotice(Notice);
	}
	 

 
 
}
