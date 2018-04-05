package com.ziniu.logistics.web.web.controller;

import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindingResult;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ziniu.logistics.web.constants.ExpCompany;
import com.ziniu.logistics.web.domain.OrderInfo;
import com.ziniu.logistics.web.domain.OrderInfoItem;
import com.ziniu.logistics.web.domain.Receiver;
import com.ziniu.logistics.web.domain.ReceiverItem;
import com.ziniu.logistics.web.domain.Sender;
import com.ziniu.logistics.web.domain.SenderItem;
import com.ziniu.logistics.web.model.EOrderModel;
import com.ziniu.logistics.web.service.ReceiverService;
import com.ziniu.logistics.web.service.SenderService;
import com.ziniu.logistics.web.service.ShippingRequestService;
import com.ziniu.logistics.web.service.UserService;
import com.ziniu.logistics.web.util.EUtil;
import com.ziniu.logistics.web.util.LocationUtil;
import com.ziniu.logistics.web.vo.ReceiverVo;
import com.ziniu.logistics.web.vo.SenderVo;
import com.ziniu.logistics.web.vo.ShippingRequestVo;

@Controller
public class SendController {
	static final Log logger = LogFactory.getLog(SendController.class);
	
	@Autowired
	private UserService userService;
	@Autowired
	private ShippingRequestService shippingRequestService;
	@Autowired 
	private SenderService senderService;
	@Autowired 
	private ReceiverService receiverService;
		
	@ModelAttribute("shippingRequestVo")
	public ShippingRequestVo createShippingRequestVo(){
		ShippingRequestVo svo = new ShippingRequestVo();
		return svo;
	}
	
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
	@RequestMapping(value="/service/send",method=RequestMethod.GET)
	public String sendRedirect(HttpServletRequest request) throws Exception{
		logger.info("sendRequestBegin");
		request.setCharacterEncoding("UTF-8");
		//获取code
		/*String code = request.getParameter("code");
		String openid = null;
		if(code != null && !"authdeny".equals(code)){
			//同意授权
			AccessTokenOAuth2 atoken_oauth2 = AccessTokenModel.getTokenOAuth(code);
			openid = atoken_oauth2.getOpenid();
		}else{
			openid="testfor123";
		}
		request.getSession().setAttribute("openid", openid);*/

		/*返回主页面*/
		return "redirect:/service/sendRedirect";
	}
	
	/*
	 * menu点击经过oauth2验证后重定向
	 * */
	@RequestMapping(value="/service/sendRedirect",method=RequestMethod.GET)
	public ModelAndView sendReqView(HttpServletRequest request) throws Exception{
		logger.info("send request begin->view:sendReq :");
		request.setCharacterEncoding("UTF-8");
		
		/*获取用户openid*/
		/*String openid = null;
		openid = request.getSession().getAttribute("openid").toString();*/
		String openid = "testfor123";
		request.getSession().setAttribute("username", openid);
		
		/*if(openid.equals(null) || openid.equals("")){
			//没有获取到openid
			return new ModelAndView("error");
		}*/
		
		/*获取用户想换的寄件人信息*/
		Sender s = senderService.getAllSenders(openid);
		String echo1 = "";
		String echo3 = "";

		Map<String,Object> map = getEmptyMap();
		map.put("openid",openid);
		
		/*寄件人部分*/
		if(s == null){
			/*没有存储的记录*/
			echo1 = "<p></p>";
			map.put("senderMan","");
			map.put("senderManAddress","");
			map.put("senderManPhone","");
			map.put("senderProvince","");
			map.put("senderCity","");
			map.put("senderCounty","");
		}else{
			/*使用默认值,默认为数据库中获得的相关记录的最后一条*/
			SenderItem[] si =  s.getSender();
			int size = s.getSize();
			size--;
			String p =  si[size].getSenderProvince();
			String city = si[size].getSenderCity();
			String county = si[size].getSenderCounty();
			String address_head = p + " " + city + county;
			String address = si[size].getSenderManAddress();
			if(address.length() > 20){
				address = address.substring(0, 19) + "...";
			}
			String man = si[size].getSenderMan();
			String phone = si[size].getSenderManPhone();

			echo1 = "<p><span class=\"icon-rt\"></span>"
			+ man + "<span class=\"icon-sj\"></span>" + phone + "</p><p><span class=\"icon-map\"></span>"
			+ address_head + "</p><p class=\"last\">" + address +"</p>";
			map.put("senderMan",man);
			map.put("senderManAddress",si[size].getSenderManAddress());
			map.put("senderManPhone",phone);
			map.put("senderProvince",p);
			map.put("senderCity",city);
			map.put("senderCounty",county);
		}
		String provinceMenu = LocationUtil.createProvinceMenu();
		/*收件人部分*/
		echo3 = "<p></p>";
		
		map.put("echo1", echo1);
		map.put("echo3", echo3);
		map.put("provinceMenu",provinceMenu);
		logger.info("send request end->view:sendReq :");
		return new ModelAndView("LogisticsRequest",map);
	}
	
	
	/*
	 * 点击寄件人地址后跳转
	 * 判断是否需要显示寄件人列表,有记录则显示,无则直接跳转到新增寄件人页面
	 * AJAX
	 * */
	@RequestMapping(value="/service/hasSender",method=RequestMethod.POST)
	public void hasSender(HttpServletRequest request,HttpServletResponse response) throws Exception{
		logger.info("hasSender begin");
		
		request.setCharacterEncoding("UTF-8");
		String openid = request.getParameter("openid");
		Long selectedId = Long.valueOf(request.getParameter("selectedId"));
		
		Sender s = senderService.getAllSenders(openid);
		if(s == null){
			logger.info("no sender");
			/*没有相关记录,直接跳转*/
			OutputStream out = response.getOutputStream();
			String resultXML = "<result><hs>0</hs></result>"; 
			out.write(resultXML.getBytes("UTF-8"));
			out.close();
		}else{
			/*有相关记录,显示列表*/
			logger.info("has sender");
			int size = s.getSize();
			logger.info("size:"+size);
			SenderItem[] si =  s.getSender();
			String addressLsit = "";
			Long id = null;
			for(int i=0; i < size; i++){
				id = si[i].getId();
				String clss = "<tr value=\"" + id + "\">";
				if(id.equals(selectedId)){
					clss = "<tr class=\"split\" value=\"" + id + "\">";
				}
				SenderItem sNow = si[i];
				addressLsit += clss + "<td class=\"memo\"></td><td><p>"
				+ sNow.getSenderMan() + "</p></td><td><p>" + sNow.getSenderManPhone() 
				+ "</p></td><td class=\"d-add\"><p><span>" + sNow.getSenderProvince()
				+ "</span><span>" + sNow.getSenderCity() + "</span><span>" + sNow.getSenderCounty()
				+ "</span>" + "<span>" + sNow.getSenderManAddress() + "</span>"
				+ "</p></td><td class=\"memo\"></td></tr>";
			}
			response.setContentType("text/xml");
			response.setCharacterEncoding("UTF-8");
			String resultXML = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>" + "<result><hs>1</hs><dr>" + addressLsit + "</dr></result>";
			OutputStream out = response.getOutputStream();
			out.write(resultXML.getBytes("UTF-8"));
			out.close();
		}
		logger.info("hasSender end");
	}
	
	/*
	 * 点击收件人地址后跳转
	 * 判断是否需要显示收件人列表,有记录则显示,无则直接跳转到新增收件人页面
	 * AJAX
	 * */
	@RequestMapping(value="/service/hasReceiver",method=RequestMethod.POST)
	public void hasReceiver(HttpServletRequest request,HttpServletResponse response) throws Exception{
		logger.info("hasReceiver begin");
		
		request.setCharacterEncoding("UTF-8");
		String openid = request.getParameter("openid");
		Long selectedId = Long.valueOf(request.getParameter("selectedId"));
		
		Receiver r = receiverService.getAllReceivers(openid);
		if(r == null){
			/*没有相关记录,直接跳转*/
			OutputStream out = response.getOutputStream();
			String resultXML = "<result><hs>0</hs></result>"; 
			out.write(resultXML.getBytes("UTF-8"));
			out.close();
		}else{
			int size = r.getSize();
			ReceiverItem[] ri =  r.getReceiver();
			String addressLsit = "";
			Long id = null;

			for(int i=0; i < size; i++){
				id = ri[i].getId();
				String clss = "<tr value=\"" + id + "\">";
				if(id.equals(selectedId)){
					clss = "<tr class=\"split\" value=\"" + id + "\">";
				}
				ReceiverItem rNow = ri[i];
				addressLsit += clss + "<td class=\"memo\"></td><td><p>"
				+ rNow.getReceiverMan() + "</p></td><td><p>" + rNow.getReceiverManPhone() 
				+ "</p></td><td class=\"d-add\"><p><span>" + rNow.getReceiverProvince()
				+ "</span><span>" + rNow.getReceiverCity() + "</span><span>" + rNow.getReceiverCounty()
				+ "</span>" + "<span>" + rNow.getReceiverManAddress() + "</span>"
				+ "</p></td><td class=\"memo\"></td></tr>";
			}
			response.setContentType("text/xml");
			response.setCharacterEncoding("UTF-8");
			String resultXML = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>" + "<result><hs>1</hs><dr>" + addressLsit + "</dr></result>";
			OutputStream out = response.getOutputStream();
			out.write(resultXML.getBytes("UTF-8"));
			out.close();
		}
		logger.info("hasReceiver end");
	}
	
	
	/*
	 * 处理sender表单的存储结果
	 * */
	@RequestMapping(value="/service/senderSave",method=RequestMethod.POST)
	public String senderSave(@ModelAttribute("senderVo") SenderVo senderVo,HttpServletRequest request) throws Exception{
		/*存入数据库*/
		/*获取地址的中文信息*/
		request.setCharacterEncoding("UTF-8");

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
				
		/*返回主页面*/
		return "redirect:/service/sendRedirect";
	}
	@RequestMapping(value="/service/senderSaveAJAX",method=RequestMethod.POST)
	public void senderSaveAJAX(@ModelAttribute("senderVo") SenderVo senderVo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		/*存入数据库*/
		/*获取地址的中文信息*/
		request.setCharacterEncoding("UTF-8");

		String[] sp1 = senderVo.getSenderCity().split(",");
		String[] sp2 = senderVo.getSenderProvince().split(",");
		String[] sp3 = senderVo.getSenderCounty().split(",");
		senderVo.setSenderCity(sp1[1]);
		senderVo.setSenderCounty(sp3[1]);
		senderVo.setSenderProvince(sp2[1]);
		logger.info("test:"+senderVo.getSenderCity()+senderVo.getSenderCounty());

		Timestamp now = new Timestamp(System.currentTimeMillis());
		senderVo.setCreateTime(now);
		senderVo.setLastUpdateTime(now);

		Long id = senderService.createSender(senderVo);		
		/*返回主页面*/
		OutputStream out = response.getOutputStream();
		String idStr = Long.toString(id);
		out.write(idStr.getBytes("UTF-8"));
		out.close();
	}
	
	/*
	 * 处理receiver表单的存储结果
	 * */
	@RequestMapping(value="/service/receiverSave",method=RequestMethod.POST)
	public String receiverSave(@ModelAttribute("receiverVo") ReceiverVo receiverVo,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");

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

		return "redirect:/service/sendRedirect";
	}
	@RequestMapping(value="/service/receiverSaveAJAX",method=RequestMethod.POST)
	public void receiverSaveAJAX(@ModelAttribute("receiverVo") ReceiverVo receiverVo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");

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

		/*返回主页面*/
		OutputStream out = response.getOutputStream();
		String idStr = Long.toString(id);
		out.write(idStr.getBytes("UTF-8"));
		out.close();
	}
	
	
	/*
	 * use for ajax 获取级联菜单
	 * */
	@RequestMapping(value="/service/sendMenu",method=RequestMethod.POST)
	public void sendReqPost(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		logger.info("send doPost");
		String menu1="", menu2="";
		if((menu1 = request.getParameter("menu1")) != "" && (menu2 = request.getParameter("menu2")) == ""){
			String[] sp = menu1.split(",");
			int id = Integer.parseInt(sp[0]);
			String resmenu2 = LocationUtil.createCityMenu(id);
			OutputStream out = response.getOutputStream();
			out.write(resmenu2.getBytes("UTF-8"));
			out.close();
		}else if((menu1 = request.getParameter("menu1")) == "" && (menu2 = request.getParameter("menu2")) != ""){
			String[] sp = menu2.split(",");
			int id = Integer.parseInt(sp[0]);
			String resmenu3 = LocationUtil.createCountyMenu(id);
			OutputStream out = response.getOutputStream();
			out.write(resmenu3.getBytes("UTF-8"));
			out.close();
		}
	}
	
	
	/*
	 * 联系人delete
	 * @Sender
	 * */
	@RequestMapping(value="/service/senderDelete",method=RequestMethod.POST)
	public void deleteSender(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		
		/*获取选择的id*/
		Long id = Long.valueOf(request.getParameter("deletedId"));
		senderService.deleteSender(id);
		
		//return "redirect:/service/sendRedirect";
	}
	
	/*
	 * 联系人delete
	 * @Receiver
	 * */
	@RequestMapping(value="/service/receiverDelete",method=RequestMethod.POST)
	public void deleteReceiver(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		
		/*获取选择的id*/
		Long id = Long.valueOf(request.getParameter("deletedId"));
		receiverService.deleteReceiver(id);
		
		/*删除后看是否为空*/
		//return "redirect:/service/receiverRedirect";
	}
	
	

	@RequestMapping(value="/service/logisticsSave",method=RequestMethod.POST)
	public ModelAndView SendResult(@ModelAttribute("shippingRequestVo") ShippingRequestVo shippingRequestVo,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");

		logger.info("Logistics Submit");
		String username = request.getSession().getAttribute("username").toString();
		Long userId = userService.getUserId(username);
		shippingRequestVo.setUserId(userId);
		shippingRequestVo.setUsername(username);
		//设置machineCode
		shippingRequestVo.setMachineCode("184392352036240");
		//设置随机快递单号
		shippingRequestVo.setOrderId(EUtil.getNumberToken(8));
		
		//设置其他信息
		
		EOrderModel m = new EOrderModel();
		OrderInfo  o = m.eOrderManager(shippingRequestVo);

		Map<String,Object> map = new HashMap<String,Object>();
		//设置图片
		String picUrl = shippingRequestVo.getLogisticsProviderCode();
		map.put("company",getCompanyName(picUrl));
		picUrl = "/web/resources/images/icons-firms/" + picUrl + ".png";
		map.put("picUrl",picUrl);
		if(o == null){
			//接口有问题
			
		}else{
			if(o.getSize() == 0){
				//获取失败
				
			}else{
				OrderInfoItem[] oi = o.getOrderInfoList();
				boolean success = oi[0].getSuccess();
				if(success){
					//订单存入数据库
					shippingRequestVo.setOrderId(oi[0].getOrderId());
					shippingRequestVo.setMailNo(oi[0].getLogisticsMailNo());
					Timestamp now = new Timestamp(System.currentTimeMillis());
					shippingRequestVo.setCreateTime(now);
					shippingRequestVo.setLastUpdateTime(now);
					shippingRequestVo = shippingRequestService.create(shippingRequestVo);
					
					String time = getTime(now);
					String time_mm = time.substring(11,16);
					
					String man1 = shippingRequestVo.getReceiverMan();
					map.put("mailNo",oi[0].getOrderId());
					map.put("status","下单成功");
					map.put("createTime", time);
					map.put("receiver", man1);
					String eresult = "<div class=\"time-d-info active\"><div class=\"time\"><span>"
							+ time_mm + "</span></div><div class=\"log-trans\"><span>"
							+ "您的订单已生成" + "</span></div></div>";
					map.put("eresult", eresult);

				}else{
					map.put("mailNo","下单失败");
					map.put("status","下单失败");
					String eresult = "<div class=\"time-d-info active\"><div class=\"time\"><span>Error</span></div><div class=\"log-trans\"><span>"
					+oi[0].getErrorDesc()+"</span></div></div>";
					map.put("eresult", eresult);
					map.put("createTime", "");
					map.put("receiver", "");
				}
			}
		}
		return new ModelAndView("LogisticsResult",map);
	}

	public String getTime(Timestamp tNow){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(tNow).toString();
		return time;
	}

	public String getCompanyName(String code){
		if(code.equals(ExpCompany.YTO.toString())){
			return "圆通速递";
		}else if(code.equals(ExpCompany.HTKY.toString())){
			return "百世汇通";
		}else if(code.equals(ExpCompany.SF.toString())){
			return "顺丰速运";
		}else if(code.equals(ExpCompany.ZTO.toString())){
			return "中通快递";
		}else if(code.equals(ExpCompany.EMS.toString())){
			return "EMS";
		}else{
			return null;
		}
	}
	
	public Map<String,Object> getEmptyMap(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("username","");
		map.put("senderMan","");
		map.put("senderManPhone","");
		map.put("senderManAddress","");
		map.put("senderProvince","");
		map.put("senderCity","");
		map.put("senderCounty","");
		map.put("receiverMan","");
		map.put("receiverManPhone","");
		map.put("receiverManAddress","");
		map.put("receiverProvince","");
		map.put("receiverCity","");
		map.put("receiverCounty","");
		return map;
	}
	
}
