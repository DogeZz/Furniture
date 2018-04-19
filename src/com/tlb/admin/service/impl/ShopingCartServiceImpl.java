package com.tlb.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.admin.service.ShopingCartService;
import com.tlb.common.JsonUtil;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbGwcDao;

@Component
public class ShopingCartServiceImpl implements ShopingCartService{
	
	@Resource
	private TTlbGwcDao tTlbGwcDao;
	
	@Transactional(readOnly = true)
	public Map<String, Object> toList() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("url", "/pc/admin/shopingCart/shopingCart_list");
		return model;
	}

	@Transactional(readOnly = true)
	public String getShopingCartDatas(PageParam page, String name) {
		Pager<List<Map<String, Object>>> pager = this.tTlbGwcDao.getTTlbGwcsByName(page, name);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}

}
