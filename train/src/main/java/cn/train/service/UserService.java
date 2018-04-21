package cn.train.service;

import java.util.List;

import cn.train.entity.User;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-14  All rights reserved.
 *
 * @ class description：用户信息service接口
 *
 */

public interface UserService {
	//有无登录用户
	public User getLoginUser(User user) throws Exception;
	
	//注册用户
	public int addUser(User user) throws Exception;
	
	//获取所有用户
	public List<User> getUserList() throws Exception;
	
	//根据id获取用户
	public User getUserById(int id) throws Exception;

}


