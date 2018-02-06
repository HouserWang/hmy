package cn.itcast.common;

public class ResultVO {
    private Integer flag;
    private String message;
    private Object data;

    public static ResultVO success(Object data,String message){
        ResultVO resultVO = new ResultVO();
        resultVO.setFlag(1);
        resultVO.setData(data);
        resultVO.setMessage(message);
        return resultVO;
    }

    public static ResultVO success(String message){
        ResultVO resultVO = new ResultVO();
        resultVO.setFlag(1);
        resultVO.setData(null);
        resultVO.setMessage(message);
        return resultVO;
    }

    public static ResultVO error(String message){
        ResultVO resultVO = new ResultVO();
        resultVO.setFlag(0);
        resultVO.setMessage(message);
        return resultVO;
    }

    @Override
    public String toString() {
        return "ResultVO{" +
                "flag=" + flag +
                ", Message='" + message + '\'' +
                ", data=" + data +
                '}';
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
