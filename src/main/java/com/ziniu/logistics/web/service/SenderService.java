package com.ziniu.logistics.web.service;

import com.ziniu.logistics.web.domain.Sender;
import com.ziniu.logistics.web.domain.SenderItem;
import com.ziniu.logistics.web.vo.SenderVo;

public interface SenderService {
	
	public Long createSender(SenderVo vo);
	
	public void updateSender(SenderVo vo);
	
	public Sender getAllSenders(String username);
	
	public SenderItem getOneSender(Long id);
	
	public void deleteSender(Long id);
	
	public Long getMaxId();
}
