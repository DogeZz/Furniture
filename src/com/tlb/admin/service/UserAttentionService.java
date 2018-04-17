package com.tlb.admin.service;

import java.util.Map;

import com.tlb.common.PageParam;

public interface UserAttentionService {

	/**
	 * 用户关注列表页索引.
	 * @return 页面
	 */
	public Map<String, Object> toList();

	/**
	 * 获取用户关注分页数据.
	 * @param page 分页参数
	 * @param name 关键字
	 * @return 数据
	 */
	public String getUserAttentionDatas(PageParam page, String name);
}
