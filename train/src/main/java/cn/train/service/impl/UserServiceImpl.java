package cn.train.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.train.dao.UserDao;
import cn.train.entity.User;
import cn.train.service.UserService;


/*
 * @ Copyright (c) Create by JASON  Date:2018-04-14  All rights reserved.
 *
 * @ class description：用户信息service实现类，业务处理
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao userDao;
	

	@Override
	public User getLoginUser(User user) throws Exception {
		return userDao.getLoginUser(user);
	}

	@Override
	public int addUser(User user) throws Exception {
		return userDao.addUser(user);
	}

	@Override
	public List<User> getUserList() throws Exception{
		return userDao.getUserList();
	}

	@Override
	public User getUserById(int id) throws Exception{
		return userDao.getUserById(id);
	}

}


