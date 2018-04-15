package com.tlb.dao;

import java.util.List;
import java.util.Map;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.BaseDao;
import com.tlb.entity.TTlbSh;

public interface TTlbShDao extends BaseDao<TTlbSh>{

	/**
	 * 通过商户名来获取商户实体.
	 */
	public TTlbSh getTTlbShByShmc(String shmc);

	/**
	 * 根据分页参数以及关键字获取商户数据.
	 */
	public Pager<List<Map<String, Object>>> getTTlbShs(PageParam page, String name);

	/**
	 * 通过商户id来获取商户实体.
	 */
	public TTlbSh getTTlbSh(String shid);

	/**
	 * 保存商户.
	 */
	public void saveTTlbSh(TTlbSh tTlbSh);

	/**
	 * 根据关键字获取所有商户(List).
	 */
	public List<TTlbSh> getTTlbShs(String name);
}
