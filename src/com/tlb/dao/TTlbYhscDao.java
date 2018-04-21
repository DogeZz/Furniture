package com.tlb.dao;

import java.util.List;
import java.util.Map;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.entity.TTlbYhsc;

public interface TTlbYhscDao extends BaseDao<TTlbYhsc>{

	/**
	 * 获取所有用户收藏.
	 */
	public Pager<List<Map<String, Object>>> getTTlbYhscs(PageParam page, String name);

	/**
	 * 保存用户收藏.
	 */
	public void saveTTlbYhsc(TTlbYhsc tTlbYhsc);

	/**
	 * 通过用户id和家具id找到指定的用户收藏.
	 */
	public TTlbYhsc getTTlbYhscByYhidAndJjid(String yhid, String jjid);

	/**
	 * 通过用户id用户收藏.
	 */
	public Pager<List<Map<String, Object>>> getTTlbYhscsByYhid(PageParam page, String yhid);

}
