package cn.itcast.pojo;

import java.sql.Timestamp;

public class Notice {

	private Integer noticeId;
	private String notice;
	private String noticeMan;
	private Timestamp noticeDate;
	
	public String getNoticeMan() {
		return noticeMan;
	}
	public void setNoticeMan(String noticeMan) {
		this.noticeMan = noticeMan;
	}
	public Timestamp getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Timestamp noticeDate) {
		this.noticeDate = noticeDate;
	}
	public Integer getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
}
