package cn.itcast.pojo;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

@TableName(value = "bbs_give_like")
public class GiveLike extends Model<GiveLike> {
    private Integer id;
    private Integer topicId;
    private Integer userId;
    private Integer likeState;

    @Override
    public String toString() {
        return "GiveLike{" +
                "id=" + id +
                ", topicId=" + topicId +
                ", userId=" + userId +
                ", likeState=" + likeState +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getLikeState() {
        return likeState;
    }

    public void setLikeState(Integer likeState) {
        this.likeState = likeState;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}
