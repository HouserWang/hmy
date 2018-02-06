package cn.itcast.mapper;

import java.util.List;

import cn.itcast.pojo.Notice;

public interface NoticeMapper {

	public List<Notice> showNotice();
	public void addNotice(Notice Notice);
	
}
