package com.ziniu.logistics.web.web.filter;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;

@Controller
public class BaseFilter implements Filter {

    static final Log logger = LogFactory.getLog(BaseFilter.class);
    private static final String METHOD_POST = "POST";

	private String encoding;
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	private String toUTF(String inStr) throws Exception {
		String outStr = "";
		if (inStr != null) {
			// The default encoding for tomcat is iso-8859-1
			outStr = new String(inStr.getBytes("iso-8859-1"), encoding);
		}
		return outStr;
	}

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest _request, ServletResponse _response, FilterChain chain) throws IOException,
            ServletException {
        logger.info("=========================================== request  start:======================================");

        HttpServletRequest request = (HttpServletRequest) _request;
        HttpServletResponse response = (HttpServletResponse) _response;

        doLog(request);
        String method = request.getMethod();
        if (METHOD_POST.equalsIgnoreCase(method)) {
			request.setCharacterEncoding(encoding);
		} else {
			// Get all the parameters
			Enumeration<String> paramNames = request.getParameterNames();
			// Iterate the parameters
			while (paramNames.hasMoreElements()) {
				// Get the parameter name
				String name = paramNames.nextElement();
				// Get the parameter values
				String values[] = request.getParameterValues(name);
				// Values are not empty
				if (values != null) {
					if (values.length == 1) {
						try {
							// try to covert the encoding
							String vlustr = toUTF(values[0]);
							// set this value in attributes;
							request.setAttribute(name, vlustr);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						for (int i = 0; i < values.length; i++) {
							try {
								String vlustr = toUTF(values[i]);
								values[i] = vlustr;
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
						request.setAttribute(name, values);
					}
				}
			}
		}
		response.setCharacterEncoding(this.encoding);
		chain.doFilter(request, response);

        logger.info("=========================================== request  end.======================================");
    }



    /**
     * log 请求
     * 
     * @param request
     */
    private void doLog(HttpServletRequest request) {
        logger.info("getRequestURL: " + request.getRequestURL());
        logger.info("getMethod: " + request.getMethod());
        logger.info("getQueryString: " + request.getQueryString());
        logger.info("getRemoteAddr: " + request.getRemoteAddr());
        logger.info("getRemotePort: " + request.getRemotePort());
        logger.info("getLocalAddr: " + request.getLocalAddr());
        logger.info("getLocalPort: " + request.getLocalPort());
        logger.info("getCharacterEncoding: " + request.getCharacterEncoding());
        logger.info("--------request.getHeader()--------");
        getHeader(request);
        logger.info("-------request.getParamterMap()-------");
        getParams(request);
    }

    @SuppressWarnings("unchecked")
    private void getHeader(HttpServletRequest request) {
        Enumeration<String> em = request.getHeaderNames();
        while (em.hasMoreElements()) {
            String name = (String) em.nextElement();
            String value = request.getHeader(name);
            logger.info(name + "=" + value);
        }
    }

    @SuppressWarnings("unchecked")
    private void getParams(HttpServletRequest request) {
        Map<String, ?> map = request.getParameterMap();
        Set<String> keySet = map.keySet();
        for (String key : keySet) {
            String[] values = (String[]) map.get(key);
            for (String value : values) {
                logger.info(key + "=" + value);
            }
        }
    }

    @Override
    public void destroy() {
    }
}
