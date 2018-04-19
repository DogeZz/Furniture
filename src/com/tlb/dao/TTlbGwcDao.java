package com.tlb.dao;

import java.util.List;
import java.util.Map;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.entity.TTlbGwc;

public interface TTlbGwcDao extends BaseDao<TTlbGwc>{

	/**
	 * 获取购物车分页数据.
	 */
	public Pager<List<Map<String, Object>>> getTTlbGwcs(PageParam page, String yhid);

	/**
	 * 保存.
	 * @param tTlbGwc
	 */
	public void saveTTlbGwc(TTlbGwc tTlbGwc);

	/**
	 * 获取购物车数据.
	 */
	public List<Map<String, Object>> getTTlbGwcForMap(String gwcid);

	/**
	 * 根据jjid获取指定数据.
	 */
	public TTlbGwc getTTlbGwcByJjid(String jjid);

	/**
	 * 获取购物车单体数据.
	 */
	public TTlbGwc getTTlbGwc(String gwcid);

	/**
	 * 获取购物车数据.
	 */
	public Pager<List<Map<String, Object>>> getTTlbGwcsByName(PageParam page, String name);

}
