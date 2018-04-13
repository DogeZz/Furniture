package com.tlb.front.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tlb.front.service.FrontService;

@Controller
public class FrontController {

	@Resource
	private FrontService frontService;
	
	@RequestMapping(value = "/front/homepage.fjsp")
	public ModelAndView homePage(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toHomePage();
		return new ModelAndView(model.get("url").toString(), model);
	}
}
