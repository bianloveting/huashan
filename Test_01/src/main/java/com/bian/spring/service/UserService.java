package com.bian.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bian.spring.entites.User;
import com.bian.spring.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;

	/**
	 * 查询用户是否存在
	 * @param userName
	 * @return
	 */
	public User checkUserNameHasExists(String userName){
		return userMapper.checkUserNameHasExists(userName);
	}
	
	/**
	 * 插入数据
	 * @param user
	 * @return
	 */
	public int RegisterUser(User user){
		return userMapper.insert(user);
	}
	
	/**
	 * 登录验证
	 * @param userName
	 * @param pass
	 * @return
	 */
	public User LoginUser(User user){
		return userMapper.LoginUser(user);
	}
	
	
}
