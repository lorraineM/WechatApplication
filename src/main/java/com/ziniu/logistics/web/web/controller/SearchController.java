package com.ziniu.logistics.web.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ziniu.logistics.web.constants.ExpCompany;
import com.ziniu.logistics.web.constants.ShippingStatus;
import com.ziniu.logistics.web.domain.Search.SearchLog;
import com.ziniu.logistics.web.domain.Search.SearchResponse;
import com.ziniu.logistics.web.domain.Search.SearchResult;
import com.ziniu.logistics.web.model.SearchModel;
import com.ziniu.logistics.web.service.UserService;
import com.ziniu.logistics.web.vo.SearchRequestVo;

@Controller
public class SearchController {
	static final Log logger = LogFactory.getLog(SearchController.class);
	
	@Autowired
	private UserService userService;

	@ModelAttribute("searchRequestVo")
	public SearchRequestVo createSearchRequestVo(){
		SearchRequestVo vo = new SearchRequestVo();
		return vo;
	}
	
	/*
	 * GET view 请求处理
	 * */
	@RequestMapping(value="/service/search",method=RequestMethod.GET)
	public String searchRedirect(HttpServletRequest request) throws Exception{
		logger.info("web-sendRequestBegin");
		
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
		return "redirect:/service/searchRedirect";
	}
	
	/*
	 * menu点击经过oauth2验证后重定向
	 * */
	@RequestMapping(value="/service/searchRedirect",method=RequestMethod.GET)
	public ModelAndView searchReqView(HttpServletRequest request) throws Exception{
		logger.info("search request begin->view:searchReq :");
		request.setCharacterEncoding("UTF-8");
		/*获取用户openid*/
		/*String openid = null;
		openid = request.getSession().getAttribute("openid").toString();
		request.getSession().setAttribute("username", openid);
		
		if(openid.equals(null) || openid.equals("")){
			//没有获取到openid
			return new ModelAndView("error");
		}*/
		
		return new ModelAndView("SearchReq");
	}
	/*
	 * 查询订单 POST 请求处理
	 * */
	@RequestMapping(value="/service/searchForm",method=RequestMethod.POST)
	public ModelAndView searchReqPost(@ModelAttribute("searchRequestVo") SearchRequestVo searchRequestVo,HttpServletRequest request) throws Exception{
		SearchModel s = new SearchModel();
		SearchResult result = s.sOrderManager(searchRequestVo);
		String res = "";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("res", res);
		map.put("company","");
		map.put("mailNo","");
		map.put("eresult","");
		map.put("status", "");
		
		if(result != null){
			if(result.getSuccess().equals("true")){
				//result success = true
				SearchResponse[] sr = result.getTrackingResponses();
				//url
				String picUrl = searchRequestVo.getLogisticsProviderCode();
				picUrl = "/web/resources/images/icons-firms/" + picUrl + ".png";
				//一般默认为单个单号的查询
				SearchResponse searchResponse = sr[0];
				String company = getCompany(searchResponse.getLogisticsProviderCode());
				String mailNo = searchResponse.getMailNo();
				String dresult = searchResponse.getResult();
				
				map.put("company",company);
				map.put("mailNo",mailNo);
				map.put("picUrl",picUrl);

				String eresult = "";
				if(dresult.equals("SUCCESS")){
					//有traceLog
					//获取状态
					String status = getStatus(searchResponse.getStatus());
					map.put("status", status);

					
					SearchLog[] trackLog = searchResponse.getTrackLog();
					int size = searchResponse.getSize();
					String maxTime = "2222-99-99";
					//第一个特殊处理
					SearchLog sl1 = trackLog[size-1];
					String[] time1 = getTime(sl1.getAcceptTime());
					String addr1 = sl1.getAcceptAddress();
					if(addr1 == null || addr1.equals("")) addr1 = "";
					int cmp1 = compareTime(time1[2],maxTime);
					if(cmp1 == 1){
						maxTime = time1[2];
						eresult += "<div class=\"d-s-title z-1\"><div class=\"inline-area\" style=\"float:left;\"><div class=\"circle\"></div><h2><span class=\"icon-date\"></span>"
						+ time1[0] + "</h2></div></div>";
					}
					eresult += "<div class=\"time-d-info active\"><div class=\"time\"><span>"
							+ time1[1] 
							+ "</span></div><div class=\"log-trans\"><span>"
							+ addr1 + " " + sl1.getRemark()
							+ "</span></div></div>";
					
					
					for(int i = size-2; i >= 0 ; i--){
						SearchLog sl = trackLog[i];
						String[] time = getTime(sl.getAcceptTime());
						//地址是否为null
						String addr = sl.getAcceptAddress();
						if(addr == null || addr.equals("")) addr = "";
						
						int cmp = compareTime(time[2],maxTime);
						if(cmp == 1){
							maxTime = time[2];
							eresult += "<div class=\"d-s-title z-1\"><div class=\"inline-area\" style=\"float:left;\"><div class=\"circle\"></div><h2><span class=\"icon-date\"></span>"
							+ time[0] + "</h2></div></div>";	
						}
						eresult += "<div class=\"time-d-info active\"><div class=\"time\"><span>"
							+ time[1] 
							+ "</span></div><div class=\"log-trans\"><span>"
							+ addr + " " + sl.getRemark()
							+ "</span></div></div>";					
					}	
				}else{
					//获取traceLog 失败
					eresult += "<div class=\"time-d-info active\"><div class=\"time\"><span style=\"color:#fabc87;\">sorry</span></div><div class=\"log-trans\"><span>没有相关订单具体信息</span></div></div>";
					map.put("status", "无信息");
				}
				map.put("eresult",eresult);
			}else{
				//result success = false
				res = "没有相关快递信息,请检查快递单号与承运公司信息是否正确";
			}
		}else{
			//SEARCH RESULT return null
			res = "没有相关快递信息,请检查快递单号与承运公司信息是否正确";
		}
		return new ModelAndView("SearchResult",map);
	}
	
	public String getCompany(String company){
		String icon_company = "";
		String name_company = "";
		if(company.equals(ExpCompany.YTO.toString())){
			icon_company = "icon-yto";
			name_company = "圆通快递";
		}else if(company.equals(ExpCompany.ZTO.toString())){
			icon_company = "icon-zto";
			name_company = "中通快递";
		}else if(company.equals(ExpCompany.SF.toString())){
			icon_company = "icon-sf";
			name_company = "顺丰快递";
		}else if(company.equals(ExpCompany.HTKY.toString())){
			icon_company = "icon-htky";
			name_company = "汇通快递";
		}else if(company.equals(ExpCompany.EMS.toString())){
			icon_company = "icon-ems";
			name_company = "中国邮政EMS";
		}	
		return name_company;
	}
	public String getStatus(String status){
		String result = "";
		if(status.equals("NOTSHIPPED")){
			result = "流转中";
		}else if(status.equals(ShippingStatus.NOMESSAGE.toString())){
			result = "暂无流转信息";
		}else if(status.equals(ShippingStatus.NOTSHIPPED.toString())){
			result = "未开始转运";
		}else if(status.equals(ShippingStatus.SIGNED.toString())){
			result = "已签收";
		}else if(status.equals(ShippingStatus.SIGNFAIL.toString())){
			result = "签收失败";
		}else{
			result = status;
		}
		return result;
	}
	public String[] getTime(String ss){ 
		//例子2014-09-27 18:06:35
		String time = ss;
		String year = time.substring(0,10);
		String day = time.substring(5,10);
		String min = time.substring(11,16);
		String[] res = new String[3];
		res[0] = day;
		res[1] = min;
		res[2] = year;
		return res;
	}
	public int compareTime(String s1,String s2){
		String y1 = s1.substring(0,4);
		String mon1 = s1.substring(5,7);
		String day1 = s1.substring(8,10);
		String y2 = s2.substring(0,4);
		String mon2 = s2.substring(5,7);
		String day2 = s2.substring(8,10);
		if(y1.compareTo(y2) < 0){
			//当前时间比记录时间早
			return 1;
		}else if(y1.compareTo(y2) == 0){
			if(mon1.compareTo(mon2) < 0){
				return 1;
			}else if(mon1.compareTo(mon2) == 0){
				if(day1.compareTo(day2) < 0)
					return 1;
				else if(day1.compareTo(day2) == 0)
					return 0;
				else
					return -1;
			}else{
				return -1;
			}
		}else{
			return -1;
		}
	}
}
