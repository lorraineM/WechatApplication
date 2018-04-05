package com.ziniu.logistics.web.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {

    protected final Log logger = LogFactory.getLog(getClass());
    
    @RequestMapping(method = RequestMethod.GET, value = "/wxOrder", params = {"openid"})
    public ModelAndView getOrder(String openid, HttpServletRequest request, HttpServletResponse response) {
        logger.info(openid);
        ModelAndView m = new ModelAndView("order");
        return m;
    }

}
