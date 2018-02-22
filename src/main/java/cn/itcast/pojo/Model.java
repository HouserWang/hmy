package cn.itcast.pojo;

import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

@TableName("bbs_model")
public class Model extends com.baomidou.mybatisplus.activerecord.Model<Model>{
	private String modelName;
	private Integer modelId;
	private Integer postsCount;
	private Date modelDate;
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public Integer getModelId() {
		return modelId;
	}
	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}
	public Integer getPostsCount() {
		return postsCount;
	}
	public void setPostsCount(Integer postsCount) {
		this.postsCount = postsCount;
	}
	public Date getModelDate() {
		return modelDate;
	}
	public void setModelDate(Date modelDate) {
		this.modelDate = modelDate;
	}

	@Override
	protected Serializable pkVal() {
		return this.modelId;
	}
}
