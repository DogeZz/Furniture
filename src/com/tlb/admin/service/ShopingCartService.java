package com.tlb.admin.service;

import java.util.Map;

import com.tlb.common.PageParam;

public interface ShopingCartService {
	/*
	 * 购物车列表页索引
	 * @return 页面
	 */
	public Map<String,Object> toList();
	
	/*
	 * 获取购物车分页数据
	 * @param page 分页参数
	 * @param name 关键字
	 * @return 数据
	 */
	public String getShopingCartDatas(PageParam page,String name);
	
	
}
