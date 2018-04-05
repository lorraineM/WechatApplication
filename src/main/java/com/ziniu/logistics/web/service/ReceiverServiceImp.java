package com.ziniu.logistics.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ziniu.logistics.web.dao.ReceiverDao;
import com.ziniu.logistics.web.domain.Receiver;
import com.ziniu.logistics.web.domain.ReceiverItem;
import com.ziniu.logistics.web.domain.SenderItem;
import com.ziniu.logistics.web.vo.ReceiverVo;


@Service
public class ReceiverServiceImp implements ReceiverService {
	@Autowired 
	private ReceiverDao mapper;

	@Override
	@Transactional
	public Long createReceiver(ReceiverVo vo) {
		int id = this.mapper.insert(vo);
		Long tid = Long.valueOf(id+"");
		return tid;
		
	}

	@Override
	@Transactional
	public void updateReceiver(ReceiverVo vo) {
		this.mapper.update(vo);
		
	}

	@Override
	@Transactional
	public Receiver getAllReceivers(String username) {
		List<ReceiverItem> l = this.mapper.select(username);
		if(l.size() > 0){
			ReceiverItem[] s = new ReceiverItem[100];
			for(int i = 0; i < l.size(); i++){
				s[i] = l.get(i);
			}
			Receiver receiver = new Receiver();
			receiver.setReceiver(s);
			receiver.setSize(l.size());
			return receiver;
		}else{
			System.out.println("null select result");
			return null;
		}
	}

	@Override
	@Transactional
	public ReceiverItem getOneReceiver(Long id) {
		return this.mapper.selectOne(id);
	}

	@Override
	@Transactional
	public void deleteReceiver(Long id) {
		this.mapper.delete(id);
		
	}
	
	@Override
	@Transactional
	public Long getMaxId() {
		ReceiverItem s = this.mapper.getMaxId();
		Long id = s.getId();
		return id;
	}

}
