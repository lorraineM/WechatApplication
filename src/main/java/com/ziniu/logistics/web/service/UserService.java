package com.ziniu.logistics.web.service;

import com.ziniu.logistics.web.domain.User;

public interface UserService {
	
	public void createUser(User user);
	
	public void deleteUser(String username);
	
	public void updateUser(User user);
	
	public Long getUserId(String username);
}
