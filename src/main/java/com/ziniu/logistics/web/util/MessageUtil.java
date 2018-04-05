package com.ziniu.logistics.web.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;
import com.ziniu.logistics.web.domain.TextMessage;

public class MessageUtil {
	/*
	 * 解析发送的xml
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,String> parseXML(HttpServletRequest request) throws IOException, DocumentException{
		Map<String,String> map = new HashMap<String,String>();
		InputStream in = request.getInputStream();
		SAXReader reader = new SAXReader();
		Document doc = reader.read(in);
		Element root = doc.getRootElement();
		Iterator it = root.elementIterator();
		while(it.hasNext()){
			Element e = (Element) it.next();
			//System.out.println(el.getData());
			map.put(e.getName(), e.getData().toString());
		}
		in.close();
		in = null;
		return map;
	}
	/*
	 * 扩展xstream使其支持CDATA
	 * */
	private static XStream xstream = new XStream(new XppDriver(){
		public HierarchicalStreamWriter createWriter(Writer out){
			return new PrettyPrintWriter(out) {
				boolean cdata = true;
				@SuppressWarnings("unchecked")
				public void startNode(String name, Class clazz){
					super.startNode(name,clazz);
				}
				protected void writeText(QuickWriter writer,String text){
					if(cdata){
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					}else{
						writer.write(text);
					}
				}
			};
		}
	});
	/*
	 * 文本消息转化为xml
	 * */
	public static String textToXML(TextMessage text){
		xstream.alias("xml", text.getClass());
		return xstream.toXML(text);
	}
}
