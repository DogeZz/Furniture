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

import com.tlb.admin.service.FurnitureTypeService;
import com.tlb.common.PageParam;
import com.tlb.entity.TTlbJjlx;

@Controller
@RequestMapping(value = "/admin/furnitureType.do")
public class FurnitureTypeController {
	
	@Resource
	private FurnitureTypeService furnitureTypeService;
	
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.furnitureTypeService.toList();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "datas")
	public String datas(HttpServletResponse response, HttpServletRequest request,
			PageParam page, @RequestParam(defaultValue = "") String name) throws IOException {
		String res = this.furnitureTypeService.getFurnitureTypeDatas(page, name);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.furnitureTypeService.toAdd();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "checkLxmcExist")
	public String checkFurnitureTypenameExist(HttpServletResponse response, HttpServletRequest request,
			String lxmc, String lxid) throws IOException {
		String res = this.furnitureTypeService.checklxmcExist(lxmc, lxid);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "save")
	public String save(HttpServletResponse response, HttpServletRequest request,
			TTlbJjlx param) throws IOException {
		String res = this.furnitureTypeService.saveFurnitureType(param);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response,
			String lxid){
		Map<String, Object> model = this.furnitureTypeService.toEdit(lxid);
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "delete")
	public String delete(HttpServletResponse response, HttpServletRequest request,
			String lxid) throws IOException {
		String res = this.furnitureTypeService.deleteFurnitureType(lxid);
		response.getWriter().print(res);
		return null;		
	}

}
