package com.tlb.admin.controller;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.stereotype.Controller;

import com.tlb.admin.service.MerchantService;
import com.tlb.common.PageParam;
import com.tlb.entity.TTlbSh;

@Controller
@RequestMapping( value = "/admin/merchant.do")
public class MerchantController {

	@Resource
	private MerchantService merchantService;
	
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.merchantService.toList();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "datas")
	public String datas(HttpServletResponse response, HttpServletRequest request,
			PageParam page, @RequestParam(defaultValue = "") String name) throws IOException {
		String res = this.merchantService.getMerchantDatas(page, name);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.merchantService.toAdd();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "checkMerchantnameExist")
	public String checkMerchantnameExist(HttpServletResponse response, HttpServletRequest request,
			String merchantname, String shid) throws IOException {
		String res = this.merchantService.checkMerchantnameExist(merchantname, shid);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "save")
	public String save(HttpServletResponse response, HttpServletRequest request,
			TTlbSh param) throws IOException {
		String res = this.merchantService.saveMerchant(param);
		response.getWriter().print(res);
		return null;		
	}
	
	@RequestMapping(params = "edit")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response,
			String shid){
		Map<String, Object> model = this.merchantService.toEdit(shid);
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "delete")
	public String delete(HttpServletResponse response, HttpServletRequest request,
			String shid) throws IOException {
		String res = this.merchantService.deleteMerchant(shid);
		response.getWriter().print(res);
		return null;		
	}
	
}
