package com.bian.spring.mapper;


import com.bian.spring.entites.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uId);
    
    //注册用户信息
    public int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    //查询用户是否存在
    public User checkUserNameHasExists(String userName);
    
    public User LoginUser(User user);
    
    
}