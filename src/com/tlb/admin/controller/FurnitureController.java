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

import com.tlb.admin.service.FurnitureService;
import com.tlb.common.PageParam;
import com.tlb.entity.TTlbJj;

@Controller
@RequestMapping(value = "/admin/furniture.do")
public class FurnitureController {
	
	@Resource
	private FurnitureService furnitureService;
	
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.furnitureService.toList();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "datas")
	public String datas(HttpServletResponse response, HttpServletRequest request,
			PageParam page, @RequestParam(defaultValue = "") String name) throws IOException {
		String res = this.furnitureService.getFurnitureDatas(page, name);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.furnitureService.toAdd();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "save")
	public String save(HttpServletResponse response, HttpServletRequest request,
			TTlbJj param) throws IOException {
		String res = this.furnitureService.saveFurniture(param);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response,
			String shid){
		Map<String, Object> model = this.furnitureService.toEdit(shid);
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "delete")
	public String delete(HttpServletResponse response, HttpServletRequest request,
			String shid) throws IOException {
		String res = this.furnitureService.deleteFurniture(shid);
		response.getWriter().print(res);
		return null;		
	}
}
