package cn.itcast.common;

public class ReplyDTO {
    /**
     * 主题id
     */
    private Integer topicId;
    /**
     * 回复内容
     */
    private String content;

    @Override
    public String toString() {
        return "ReplyDTO{" +
                "topicId=" + topicId +
                ", content='" + content + '\'' +
                '}';
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
