package com.ziniu.logistics.web.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ziniu.logistics.web.constants.ExpCompany;
import com.ziniu.logistics.web.dao.UserDao;
import com.ziniu.logistics.web.service.ShippingRequestService;
import com.ziniu.logistics.web.vo.ShippingRequestVo;

@Controller
public class MyExpController {
static final Log logger = LogFactory.getLog(MyExpController.class);
	
	@Autowired
	private ShippingRequestService shippingRequestService;
	
	/*
	 * GET view 请求处理(未完成)
	 * */
	@RequestMapping(value="/service/myLogistics",method=RequestMethod.GET)
	public String myexpReq(HttpServletRequest request) throws Exception{
		logger.info("sendRequestBegin");
		request.setCharacterEncoding("UTF-8");
		
		/*返回主页面*/
		return "redirect:/service/myLogisticsRedirect";
	}
	
	@RequestMapping(value="/service/myLogisticsRedirect",method=RequestMethod.GET)
	public ModelAndView logisticsManagerView(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");

		String openid = "testfor123";
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("openid", openid);
		List<ShippingRequestVo> lsv = shippingRequestService.getAllOrder(openid);
		int size = lsv.size();
		String s1 = "<td class=\"time\"><p>";
		String s2 = "</p></td><td class=\"memo\"></td><td class=\"d-last\"><p><a class=\"d-l-s\" >查状态</a><em class=\"ft-bar\">|</em><a class=\"d-l-d\" >详情</a></p>";
		
		String result = "";
		if(size > 0){
			for(int i = 0; i < size; i++){
				if(i%2 == 1){
					result += "<tr class=\"split\" id=\"";
				}else{
					result += "<tr id=\"";
				}
				ShippingRequestVo tvo = lsv.get(i);
				String id = Long.toString(tvo.getId());
				String time = getTime(tvo.getCreateTime());
				String mailNo = tvo.getOrderId();
				String sman = tvo.getSenderMan();
				String sp = tvo.getSenderProvince();
				String sc = tvo.getSenderCity();
				String scc = tvo.getSenderCounty();
				String stel = tvo.getSenderManPhone();
				String sa = tvo.getSenderManAddress();
				String rman = tvo.getReceiverMan();
				String rp = tvo.getReceiverProvince();
				String rc = tvo.getReceiverCity();
				String rcc = tvo.getReceiverCounty();
				String rtel = tvo.getReceiverManPhone();
				String ra = tvo.getReceiverManAddress();
				String company = tvo.getLogisticsProviderCode();
				result += id + "\">" + s1
				+ time.substring(0,10) + "</p><p class=\"ft-gray\">" 
				+ time.substring(11, 15) + "</p></td><td><p>" + mailNo
				+ "</p></td><td class\"d-add\"><p>" + rman
				+ "</p><p>" + rp + rc + rcc + ra + "</p></td><td><p>"
				+ getCompanyName(company) + s2;

				//订单具体信息
				String detail = "<input type=\"hidden\" id=\"s" + id + "\" sman=\"" + sman + "\" sp=\""
				+ sp + "\" sc=\"" + sc + "\" scc=\"" + scc + "\" stel=\"" + stel + "\" sa=\""
				+ sa + "\">";
				detail += "<input type=\"hidden\" id=\"r" + id + "\" rman=\"" + rman + "\" rp=\""
				+ rp + "\" rc=\"" + rc + "\" rcc=\"" + rcc + "\" rtel=\"" + rtel + "\" ra=\""
				+ ra + "\">";
				detail += "<input type=\"hidden\" id=\"p" + id + "\" value=\"" + company + "\">";
				result += detail + "</td></tr>";

			}
			map.put("result", result);
		}else{
			result += "<tr>" + s1 + "</p><p class=\"ft-gray\"></p></td><td><p></p></td><td class\"d-add\"><p></p><p>" + s2 + "</td></tr>";
			map.put("result", result);
		}
		map.put("openid", openid);
		return new ModelAndView("LogisticsManager",map);
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
}
