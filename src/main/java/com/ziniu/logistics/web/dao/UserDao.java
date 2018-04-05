package com.ziniu.logistics.web.dao;

import org.apache.ibatis.annotations.Param;

import com.ziniu.logistics.web.domain.User;

public interface UserDao{
	
	public void insert(User user);
	
	public void update(User user);
	
	public void delete(@Param("username") String username);
		
	/*获取场景二维码*/
	public Long getUserIdByUserame(@Param("username") String username);
}
