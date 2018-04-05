package com.ziniu.logistics.web.web.controller;

import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ziniu.logistics.web.domain.Receiver;
import com.ziniu.logistics.web.domain.ReceiverItem;
import com.ziniu.logistics.web.domain.Sender;
import com.ziniu.logistics.web.domain.SenderItem;
import com.ziniu.logistics.web.service.ReceiverService;
import com.ziniu.logistics.web.service.SenderService;
import com.ziniu.logistics.web.util.LocationUtil;
import com.ziniu.logistics.web.vo.ReceiverVo;
import com.ziniu.logistics.web.vo.SenderVo;
@Controller
public class AddressController{
	static final Log logger = LogFactory.getLog(AddressController.class);

	@Autowired 
	private SenderService senderService;
	@Autowired 
	private ReceiverService receiverService;

	@ModelAttribute("senderVo")
	public SenderVo createSenderVo(){
		SenderVo vo = new SenderVo();
		return vo;
	}
	
	@ModelAttribute("receiverVo")
	public ReceiverVo createReceiverVo(){
		ReceiverVo vo = new ReceiverVo();
		return vo;
	}
	
	/*
	 * GET view 请求处理
	 * view sendReq - view id = 1
	 * */
	@RequestMapping(value="/service/addressManager",method=RequestMethod.GET)
	public String addRedirect(HttpServletRequest request) throws Exception{
		logger.info("sendRequestBegin");
		request.setCharacterEncoding("UTF-8");

		//测试部分手动添加session
		String openid = "testfor123";
		//request.getSession().setAttribute("openid", openid);
		return "redirect:/service/receiverAddressManager";
	}

	@RequestMapping(value="/service/receiverAddressManager",method=RequestMethod.GET)
	public ModelAndView ram(HttpServletRequest request) throws Exception{
		logger.info("get receiver address manager view");
		request.setCharacterEncoding("UTF-8");

		String openid = "testfor123";

		Map<String,String> map = new HashMap<String,String>();

		Receiver r = receiverService.getAllReceivers(openid);
		String addressLsit = "";
		Long id = null;
		if(r == null){
			addressLsit = "<tr><td class=\"time\"><p></p><p class=\"ft-gray\"></p></td><td><p></p></td><td><p></p></td><td class=\"d-add\"><p></p></td><td class=\"memo\"></td><td><p></p></td></tr>";
		}else{
			int size = r.getSize();
			ReceiverItem[] ri =  r.getReceiver();

			for(int i=0; i < size; i++){
				id = ri[i].getId();
				if(i%2 == 1){
					addressLsit += "<tr class=\"split\" id=\"";
				}else{
					addressLsit += "<tr id=\"";
				}
				ReceiverItem rNow = ri[i];

				String time = rNow.getCreateTime().toString();
				time = time.substring(0, time.length()-2);
				addressLsit += id + "\">" + "<td class=\"time\"><p>" + time.substring(0,10)
				+ "</p><p class=\"ft-gray\">" + time.substring(11,16) + "</p></td><td><p>"
				+ rNow.getReceiverMan() + "</p></td><td><p>" + rNow.getReceiverManPhone()
				+ "</p></td><td class=\"d-add\"><p>" + rNow.getReceiverProvince() + rNow.getReceiverCity()
				+ rNow.getReceiverCounty() + rNow.getReceiverManAddress() + "</p></td><td class=\"memo\"></td><td><p><a>删除</a></p></td></tr>";

			}
		}
		String provinceMenu = LocationUtil.createProvinceMenu();
		map.put("openid", openid);
		map.put("AddressList",addressLsit);
		map.put("provinceMenu",provinceMenu);
		return new ModelAndView("AddressManagerR",map);
	}

	/*
	 * 处理receiver表单的存储结果
	 * */
	@RequestMapping(value="/service/receiverSaves",method=RequestMethod.POST)
	public String receiverSave(@ModelAttribute("receiverVo") ReceiverVo receiverVo,HttpServletRequest request) throws Exception{
		String[] sp1 = receiverVo.getReceiverCity().split(",");
		String[] sp2 = receiverVo.getReceiverProvince().split(",");
		String[] sp3 = receiverVo.getReceiverCounty().split(",");
		
		receiverVo.setReceiverCity(sp1[1]);
		receiverVo.setReceiverCounty(sp3[1]);
		receiverVo.setReceiverProvince(sp2[1]);

		Timestamp now = new Timestamp(System.currentTimeMillis());
		receiverVo.setCreateTime(now);
		receiverVo.setLastUpdateTime(now);

		Long id = receiverService.createReceiver(receiverVo);

		return "redirect:/service/addressManager";
	}

	@RequestMapping(value="/service/senderAddressManager",method=RequestMethod.GET)
	public ModelAndView sam(HttpServletRequest request) throws Exception{
		logger.info("get sender address manager view");
		request.setCharacterEncoding("UTF-8");

		String openid = "testfor123";

		Map<String,String> map = new HashMap<String,String>();

		Sender s = senderService.getAllSenders(openid);
		String addressLsit = "";
		Long id = null;
		if(s == null){
			addressLsit = "<tr><td class=\"time\"><p></p><p class=\"ft-gray\"></p></td><td><p></p></td><td><p></p></td><td class=\"d-add\"><p></p></td><td class=\"memo\"></td><td><p></p></td></tr>";
		}else{
			int size = s.getSize();
			SenderItem[] si =  s.getSender();

			for(int i=0; i < size; i++){
				id = si[i].getId();
				if(i%2 == 1){
					addressLsit += "<tr class=\"split\" id=\"";
				}else{
					addressLsit += "<tr id=\"";
				}
				SenderItem sNow = si[i];

				String time = sNow.getCreateTime().toString();
				time = time.substring(0, time.length()-2);
				addressLsit += id + "\">" + "<td class=\"time\"><p>" + time.substring(0,10)
				+ "</p><p class=\"ft-gray\">" + time.substring(11,16) + "</p></td><td><p>"
				+ sNow.getSenderMan() + "</p></td><td><p>" + sNow.getSenderManPhone()
				+ "</p></td><td class=\"d-add\"><p>" + sNow.getSenderProvince() + sNow.getSenderCity()
				+ sNow.getSenderCounty() + sNow.getSenderManAddress() + "</p></td><td class=\"memo\"></td><td><p><a>删除</a></p></td></tr>";

			}
		}
		String provinceMenu = LocationUtil.createProvinceMenu();
		map.put("openid", openid);
		map.put("AddressList",addressLsit);
		map.put("provinceMenu",provinceMenu);
		return new ModelAndView("AddressManagerS",map);
	}

	/*
	 * 处理sneder表单的存储结果
	 * */
	@RequestMapping(value="/service/senderSaves",method=RequestMethod.POST)
	public String senderSave(@ModelAttribute("senderVo") SenderVo senderVo,HttpServletRequest request) throws Exception{
		String[] sp1 = senderVo.getSenderCity().split(",");
		String[] sp2 = senderVo.getSenderProvince().split(",");
		String[] sp3 = senderVo.getSenderCounty().split(",");
		
		senderVo.setSenderCity(sp1[1]);
		senderVo.setSenderCounty(sp3[1]);
		senderVo.setSenderProvince(sp2[1]);

		Timestamp now = new Timestamp(System.currentTimeMillis());
		senderVo.setCreateTime(now);
		senderVo.setLastUpdateTime(now);

		Long id = senderService.createSender(senderVo);

		return "redirect:/service/senderAddressManager";
	}
	
}