package com.ziniu.logistics.web.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ziniu.logistics.web.dao.UserDao;
import com.ziniu.logistics.web.domain.User;

@Service
public class UserServiceImp implements UserService {
	
	@Autowired
	private UserDao mapper;

	@Override
	@Transactional
	public void createUser(User user) {
		this.mapper.insert(user);
	}

	@Override
	@Transactional
	public void deleteUser(String username) {
		this.mapper.delete(username);
	}

	@Override
	@Transactional
	public void updateUser(User user) {
		this.mapper.update(user);	
	}

	@Override
	@Transactional
	public Long getUserId(String username) {
		return this.mapper.getUserIdByUserame(username);
	}
	
	@Resource
	public void setMapper(UserDao mapper){
		this.mapper = mapper;
	}
}
