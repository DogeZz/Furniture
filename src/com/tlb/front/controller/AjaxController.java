package com.tlb.front.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlb.entity.TTlbYh;
import com.tlb.front.service.AjaxService;

@Controller
public class AjaxController {

	@Resource 
	private AjaxService ajaxService;
	
	@RequestMapping(value = "/front/login.ajx")
	public String login(HttpServletResponse response, HttpServletRequest request, 
			String username, String password) throws Exception {
		String res = this.ajaxService.getLoginResult(username, password);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/checkUsernameExist.ajx")
	public String checkUsernameExist(HttpServletResponse response, HttpServletRequest request, 
			String username) throws Exception {
		String res = this.ajaxService.toCheckUsernameExist(username);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/saveRegister.ajx")
	public String saveRegister(HttpServletResponse response, HttpServletRequest request, 
			TTlbYh tTlbYh) throws Exception {
		String res = this.ajaxService.toSaveRegister(tTlbYh);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getUser.ajx")
	public String getUser(HttpServletResponse response, HttpServletRequest request, 
			String username) throws Exception {
		String res = this.ajaxService.toGetUser(username);
		response.getWriter().print(res);
		return null;
	}
}
