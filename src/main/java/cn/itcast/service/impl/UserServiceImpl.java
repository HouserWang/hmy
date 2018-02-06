package cn.itcast.service.impl;

import javax.annotation.Resource;


import cn.itcast.pojo.User;
import org.springframework.stereotype.Service;

import cn.itcast.mapper.UserMapper;
import cn.itcast.service.UserService;

 
@Service
public class UserServiceImpl implements UserService {
	@Resource
    private UserMapper userMapper;

	 
	@Override
	public void addUser(User User) {
		// TODO Auto-generated method stub
		userMapper.addUser(User);
	}

	@Override
	public void deleteUser(User User) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(User User) {
		userMapper.updateUser(User);
		
	} 

	@Override
	public String checkPwd(String email) {
		
		return userMapper.checkPwd(email);
		
	}

	@Override
	public boolean checkEmail(String email) {
		if(userMapper.checkEmail(email)>0){
		   return true;
		}
		else{
			return false;//存在
		}
	}

	@Override
	public User findUserByEmail(String email) {
		 
		return userMapper.findUserByEmail(email);
	}

	@Override
	public User findUserById(String userId) {
		// TODO Auto-generated method stub
		
		return userMapper.findUserById(userId);
	}

	 
	 

	 

}
