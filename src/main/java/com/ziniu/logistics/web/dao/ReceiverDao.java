package com.ziniu.logistics.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ziniu.logistics.web.domain.ReceiverItem;
import com.ziniu.logistics.web.vo.ReceiverVo;


public interface ReceiverDao {
	
	public int insert(ReceiverVo s);
	
	public void update(ReceiverVo s);
	
	public void delete(Long id);
	
	public List<ReceiverItem> select(@Param("username") String username);
	
	public ReceiverItem selectOne(@Param("id") Long id);
	
	public ReceiverItem getMaxId();
}
