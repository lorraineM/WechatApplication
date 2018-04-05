package com.ziniu.logistics.web.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ziniu.logistics.web.so.PageList;
import com.ziniu.logistics.web.so.ShippingRequestSO;
import com.ziniu.logistics.web.vo.ShippingRequestVo;
import com.ziniu.logistics.web.dao.ShippingRequestDao;

@Service
public class ShippingRequestServiceImp implements ShippingRequestService {
	@Autowired
	private ShippingRequestDao mapper;
	
	@Override
	@Transactional
	public ShippingRequestVo create(ShippingRequestVo vo) {
		this.mapper.insert(vo);
		return vo;
	}

	@Override
	@Transactional
	public void update(ShippingRequestVo vo) {
		this.mapper.update(vo);
	}

	@Override
	@Transactional
	public void delete(Long id) {
		this.mapper.delete(id);
	}

	@Override
	@Transactional
	public ShippingRequestVo get(Long id) {
		return (ShippingRequestVo) this.mapper.get(id);
	}
	
	@Override
	@Transactional
	public List<ShippingRequestVo> getAllOrder(String username) {
		return this.mapper.getAllOrder(username);
	}

	@Override
	public PageList<ShippingRequestVo> getPageList(ShippingRequestSO so) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, String> fetchEshippingOrder(
			ShippingRequestVo requestOrder) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registToEdi(Long id) {
		// TODO Auto-generated method stub
		
	}
	public ShippingRequestDao getMapper(){
		return mapper;
	}
	
	@Resource
	public void setMapper(ShippingRequestDao mapper){
		this.mapper = mapper;
	}
}