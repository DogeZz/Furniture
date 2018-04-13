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

}
