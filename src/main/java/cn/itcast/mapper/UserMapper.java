package cn.itcast.mapper;

import cn.itcast.pojo.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;


public interface UserMapper extends BaseMapper<User>{
   public User findUserByEmail(String email);
   public User findUserById(String userId);
   public void addUser(User User);//添加注册用户
   public void deleteUser(User User);
   public void updateUser(User User);
   public Integer checkEmail(String email);//检查邮箱是否已经存在
   public String checkPwd(String email);
}
