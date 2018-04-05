package com.ziniu.logistics.web.service;

import com.ziniu.logistics.web.domain.Receiver;
import com.ziniu.logistics.web.domain.ReceiverItem;
import com.ziniu.logistics.web.vo.ReceiverVo;

public interface ReceiverService {
	
	public Long createReceiver(ReceiverVo vo);
	
	public void updateReceiver(ReceiverVo vo);
	
	public Receiver getAllReceivers(String username);
	
	public ReceiverItem getOneReceiver(Long id);
	
	public void deleteReceiver(Long id);
	
	public Long getMaxId();
}