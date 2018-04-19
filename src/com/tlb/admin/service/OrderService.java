package com.tlb.admin.service;

import java.util.Map;

import com.tlb.common.PageParam;

public interface OrderService {

	public Map<String, Object> toList();

	public String getOrderDatas(PageParam page, String name);

	public String saveOrder(String ddid);

}
