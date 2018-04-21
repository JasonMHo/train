package cn.train.dao;

import java.util.List;

import cn.train.entity.User;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-14  All rights reserved.
 *
 * @ class description：用户DAO接口
 *
 */
public interface UserDao {
	//有无登录用户
	public User getLoginUser(User user) throws Exception;
	
	//注册用户
	public int addUser(User user) throws Exception;
	
	//获取所有用户
	public List<User> getUserList();
	
	//根据id获取用户
	public User getUserById(int id);

}


