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

import com.tlb.admin.service.ShopingCartService;
import com.tlb.common.PageParam;

@Controller
@RequestMapping(value = "/admin/shopingCart.do")
public class ShopingCartController {
	@Resource
	private ShopingCartService shopingCartService;
	
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.shopingCartService.toList();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "datas")
	public String datas(HttpServletResponse response, HttpServletRequest request,
			PageParam page, @RequestParam(defaultValue = "") String name) throws IOException {
		String res = this.shopingCartService.getShopingCartDatas(page, name);
		response.getWriter().print(res);
		return null;		
	}
}
