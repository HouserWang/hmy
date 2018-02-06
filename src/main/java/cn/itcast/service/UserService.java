package cn.itcast.service;

import cn.itcast.pojo.User;


public interface UserService {
	    
	     void addUser(User User);
	     void deleteUser(User User);
	     void updateUser(User User);
	     boolean checkEmail(String email);
	     String checkPwd(String email);
	     User findUserByEmail(String email);
	     User findUserById(String userId);
}
