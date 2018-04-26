package com.tlb.admin.service;

import java.util.Map;

public interface StatisticsService {

	/*
	 * 统计列表页索引
	 * @return 页面
	 */
	public Map<String,Object> toList();
	
	/*
	 * 获取统计分页数据
	 * @param page 分页参数
	 * @param name 关键字
	 * @return 数据
	 */
	public String getStatisticsDatas(String name);
}
