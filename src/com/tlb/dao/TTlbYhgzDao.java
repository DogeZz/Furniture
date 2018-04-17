package com.tlb.dao;

import java.util.List;
import java.util.Map;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.entity.TTlbYhgz;

public interface TTlbYhgzDao extends BaseDao<TTlbYhgz>{

	/**
	 * 获取所有用户关注.
	 */
	public Pager<List<Map<String, Object>>> getTTlbYhgzs(PageParam page, String name);

	/**
	 * 听过用户id和商户id来获取用户关注.
	 */
	public TTlbYhgz getTTlbYhgzByYhidAndShid(String yhid, String shid);

	/**
	 * 保存或修改用户关注.
	 */
	public void saveTTlbYhgz(TTlbYhgz tTlbYhgz);

}
