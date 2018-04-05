package com.ziniu.logistics.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ziniu.logistics.web.dao.SenderDao;
import com.ziniu.logistics.web.domain.Sender;
import com.ziniu.logistics.web.domain.SenderItem;
import com.ziniu.logistics.web.vo.SenderVo;

@Service
public class SenderServiceImp implements SenderService {

	@Autowired 
	private SenderDao mapper;
	
	@Override
	@Transactional
	public Long createSender(SenderVo vo) {
		int id =  this.mapper.insert(vo);
		Long tid = Long.valueOf(id+"");
		return tid;
	}

	@Override
	@Transactional
	public void updateSender(SenderVo vo) {
		this.mapper.update(vo);
	}

	@Override
	@Transactional
	public Sender getAllSenders(String username) {
		List<SenderItem> l = this.mapper.select(username);
		if(l.size() > 0){
			SenderItem[] s = new SenderItem[100];
			for(int i = 0; i < l.size(); i++){
				s[i] = l.get(i);
			}
			Sender sender = new Sender();
			sender.setSender(s);
			sender.setSize(l.size());
			return sender;
		}else{
			System.out.println("null select result");
			return null;
		}
	}

	@Override
	@Transactional
	public void deleteSender(Long id) {
		this.mapper.delete(id);
	}

	@Override
	@Transactional
	public SenderItem getOneSender(Long id) {
		return this.mapper.selectOne(id);
	}

	@Override
	@Transactional
	public Long getMaxId() {
		SenderItem s = this.mapper.getMaxId();
		Long id = s.getId();
		return id;
	}

}
