package com.tlb.admin.controller;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tlb.admin.service.MessageService;
import com.tlb.common.PageParam;
import com.tlb.entity.TTlbGg;

@Controller
@RequestMapping(value = "/admin/message.do")
public class MessageController {

	@Resource
	private MessageService messageService;
	
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.messageService.toList();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "datas")
	public String datas(HttpServletResponse response, HttpServletRequest request,
			PageParam page, @RequestParam(defaultValue = "") String name) throws IOException {
		String res = this.messageService.getMessageDatas(page, name);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.messageService.toAdd();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "save")
	public String save(HttpServletResponse response, HttpServletRequest request,
			TTlbGg param) throws IOException {
		String res = this.messageService.saveMessage(param);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response,
			String ggid){
		Map<String, Object> model = this.messageService.toEdit(ggid);
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "delete")
	public String delete(HttpServletResponse response, HttpServletRequest request,
			String ggid) throws IOException {
		String res = this.messageService.deleteMessage(ggid);
		response.getWriter().print(res);
		return null;		
	}
}
