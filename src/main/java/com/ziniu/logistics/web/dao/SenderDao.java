package com.ziniu.logistics.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ziniu.logistics.web.domain.SenderItem;
import com.ziniu.logistics.web.vo.SenderVo;

public interface SenderDao {
	
	public int insert(SenderVo s);
	
	public void update(SenderVo s);
	
	public void delete(Long id);
	
	public List<SenderItem> select(@Param("username") String username);
	
	public SenderItem selectOne(@Param("id") Long id);
	
	public SenderItem getMaxId();
}
