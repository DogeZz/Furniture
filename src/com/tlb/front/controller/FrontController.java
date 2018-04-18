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
	
	@RequestMapping(value = "/front/homePage.fjsp")
	public ModelAndView homePage(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toHomePage();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/login.fjsp")
	public ModelAndView login(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toLogin();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/register.fjsp")
	public ModelAndView register(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toRegister();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/personalInfo.fjsp")
	public ModelAndView personalInfo(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toPersonalInfo();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/detail.fjsp")
	public ModelAndView detail(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toDetail();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/type.fjsp")
	public ModelAndView type(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toType();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/merchantList.fjsp")
	public ModelAndView merchantList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toMerchantList();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/merchantDetail.fjsp")
	public ModelAndView merchantDetail(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toMerchantDetail();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/deliveryAddress.fjsp")
	public ModelAndView deliveryAddress(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toDeliveryAddress();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/buy.fjsp")
	public ModelAndView buy(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toBuy();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/basket.fjsp")
	public ModelAndView basket(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toBasket();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/myOrder.fjsp")
	public ModelAndView myOrder(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toMyOrder();
		return new ModelAndView(model.get("url").toString(), model);
	}
	
	@RequestMapping(value = "/front/shoppingCart.fjsp")
	public ModelAndView shoppingCart(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> model = this.frontService.toShoppingCart();
		return new ModelAndView(model.get("url").toString(), model);
	}
}
