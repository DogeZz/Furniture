package com.tlb.front.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.front.service.FrontService;

@Component
public class FrontServiceImpl implements FrontService{

	@Transactional( readOnly = true )
	public Map<String, Object> toHomePage() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/homePage/homePage");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toLogin() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/homePage/login");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toRegister() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/homePage/register");
		return map;
	}
	
	@Transactional( readOnly = true )
	public Map<String, Object> toPersonalInfo() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/personalInfo/personalInfo");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toDetail() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/detail/detail");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toType() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/homePage/type");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toMerchantList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/merchant/merchantList");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toMerchantDetail() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/merchant/merchantDetail");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toDeliveryAddress() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/personalInfo/deliveryAddress");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toBuy() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/detail/buy");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toBasket() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/detail/basket");
		return map;
	}

	@Transactional( readOnly = true )
	public Map<String, Object> toShoppingCart() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "/pc/front/personalInfo/shoppingCart");
		return map;
	}
}
