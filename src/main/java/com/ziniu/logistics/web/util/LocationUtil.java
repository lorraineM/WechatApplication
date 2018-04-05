package com.ziniu.logistics.web.util;

import java.util.List;

import com.ziniu.logistics.web.domain.Location;
import com.ziniu.logistics.web.model.LocationModel;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class LocationUtil {
	private static final String  proURL = "http://121.40.82.1/services/address/getAddress/1";
	private static final String baseURL = "http://121.40.82.1/services/address/getAddress/";
	private static LocationModel getAllProvince() throws Exception{
		JSONArray jarray = JSONArray.fromObject(HttpRequestUtil.getDoGetURL(proURL, "UTF-8"));
		int size = jarray.size();
		
		LocationModel pm = new LocationModel();
		Location[] plocs = new Location[size];
		
		Object[] obj = new Object[jarray.size()];
		jarray.toArray(obj);

		for(int i=0;i<size;i++){
			String json = obj[i].toString();
			JSONObject j = JSONObject.fromObject(json);
			plocs[i] = (Location) JSONObject.toBean(j, Location.class);	
		}
		pm.setSize(size);
		pm.setLocation(plocs);
		
		return pm;
	}
	private static LocationModel getAllCity(int id) throws Exception{
		final String cityURL = baseURL + id;
		JSONArray jarray = JSONArray.fromObject(HttpRequestUtil.getDoGetURL(cityURL, "UTF-8"));
		int size = jarray.size();
		
		LocationModel cm = new LocationModel();
		Location[] clocs = new Location[size];
		
		Object[] obj = new Object[jarray.size()];
		jarray.toArray(obj);
		

		for(int i=0;i<size;i++){
			String json = obj[i].toString();
			JSONObject j = JSONObject.fromObject(json);
			clocs[i] = (Location) JSONObject.toBean(j, Location.class);	
		}
		cm.setSize(size);
		cm.setLocation(clocs);
		return cm;
	}
	private static LocationModel getAllCounty(int id) throws Exception{
		final String disURL = baseURL + id;
		JSONArray jarray = JSONArray.fromObject(HttpRequestUtil.getDoGetURL(disURL, "UTF-8"));
		int size = jarray.size();
		
		LocationModel dm = new LocationModel();
		Location[] dlocs = new Location[size];
		
		Object[] obj = new Object[jarray.size()];
		jarray.toArray(obj);
		

		for(int i=0;i<size;i++){
			String json = obj[i].toString();
			JSONObject j = JSONObject.fromObject(json);
			dlocs[i] = (Location) JSONObject.toBean(j, Location.class);	
		}
		dm.setSize(size);
		dm.setLocation(dlocs);
		return dm;
	}
	public static String createProvinceMenu() throws Exception{
		String result = "";

		LocationModel plm = LocationUtil.getAllProvince();
		Location[] plc = plm.getLocation();
		int size = plm.getSize();
		
		int fsize = size/4*4;
		for(int i=0;i<fsize;i+=4){
			Location l1 = plc[i];
			Location l2 = plc[i+1];
			Location l3 = plc[i+2];
			Location l4 = plc[i+3];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String n3 = l3.getName();
			String n4 = l4.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			String v3 = l3.getId() + "," + n3;
			String v4 = l4.getId() + "," + n4;
			String str = "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a><a value=\"" + v3 + "\">" + n3 
			+ "<a class=\"last\" value=\"" + v4 + "\">" + n4 + "</a></li>";
			result += str;
		}
		int diff = size - fsize;
		if(diff == 0)
			return result;
		if(diff == 3){
			Location l1 = plc[fsize];
			Location l2 = plc[fsize+1];
			Location l3 = plc[fsize+2];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String n3 = l3.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			String v3 = l3.getId() + "," + n3;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a><a value=\"" + v3 + "\">" + n3 + "</a></li>";
		}else if(diff == 2){
			Location l1 = plc[fsize];
			Location l2 = plc[fsize+1];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a></li>";
		}else{
			Location l1 = plc[fsize];
			String n1 = l1.getName();
			String v1 = l1.getId() + "," + n1;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a></li>";
		}
		return result;
	}
	public static String createCityMenu(int id) throws Exception{
		String result = "";

		LocationModel clm = LocationUtil.getAllCity(id);
		Location[] clc = clm.getLocation();
		int size = clm.getSize();
		
		int fsize = size/4*4;
		for(int i=0;i<fsize;i+=4){
			Location l1 = clc[i];
			Location l2 = clc[i+1];
			Location l3 = clc[i+2];
			Location l4 = clc[i+3];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String n3 = l3.getName();
			String n4 = l4.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			String v3 = l3.getId() + "," + n3;
			String v4 = l4.getId() + "," + n4;
			String str = "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a><a value=\"" + v3 + "\">" + n3 
			+ "<a class=\"last\" value=\"" + v4 + "\">" + n4 + "</a></li>";
			result += str;
		}
		int diff = size - fsize;
		if(diff == 0)
			return result;
		if(diff == 3){
			Location l1 = clc[fsize];
			Location l2 = clc[fsize+1];
			Location l3 = clc[fsize+2];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String n3 = l3.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			String v3 = l3.getId() + "," + n3;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a><a value=\"" + v3 + "\">" + n3 + "</a></li>";
		}else if(diff == 2){
			Location l1 = clc[fsize];
			Location l2 = clc[fsize+1];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a></li>";
		}else{
			Location l1 = clc[fsize];
			String n1 = l1.getName();
			String v1 = l1.getId() + "," + n1;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a></li>";
		}
		return result;
	}
	public static String createCountyMenu(int id) throws Exception{
		String result = "";

		LocationModel clm = LocationUtil.getAllCounty(id);
		Location[] clc = clm.getLocation();
		int size = clm.getSize();
		
		int fsize = size/4*4;
		for(int i=0;i<fsize;i+=4){
			Location l1 = clc[i];
			Location l2 = clc[i+1];
			Location l3 = clc[i+2];
			Location l4 = clc[i+3];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String n3 = l3.getName();
			String n4 = l4.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			String v3 = l3.getId() + "," + n3;
			String v4 = l4.getId() + "," + n4;
			String str = "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a><a value=\"" + v3 + "\">" + n3 
			+ "<a class=\"last\" value=\"" + v4 + "\">" + n4 + "</a></li>";
			result += str;
		}
		int diff = size - fsize;
		if(diff == 0)
			return result;
		if(diff == 3){
			Location l1 = clc[fsize];
			Location l2 = clc[fsize+1];
			Location l3 = clc[fsize+2];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String n3 = l3.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			String v3 = l3.getId() + "," + n3;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a><a value=\"" + v3 + "\">" + n3 + "</a></li>";
		}else if(diff == 2){
			Location l1 = clc[fsize];
			Location l2 = clc[fsize+1];
			String n1 = l1.getName();
			String n2 = l2.getName();
			String v1 = l1.getId() + "," + n1;
			String v2 = l2.getId() + "," + n2;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a><a value=\""
			+ v2 + "\">" + n2 + "</a></li>";
		}else{
			Location l1 = clc[fsize];
			String n1 = l1.getName();
			String v1 = l1.getId() + "," + n1;
			result += "<li><a class=\"first\" value=\"" + v1 + "\">" + n1 + "</a></li>";
		}
		return result;
	}
}
