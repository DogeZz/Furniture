package com.tlb.dao;

import java.util.List;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.entity.TTlbJjlx;


public interface TTlbJjlxDao extends BaseDao<TTlbJjlx> {
	/*
	 * 通过家具类型id获取家具类型实体
	 * 
	 */
	public TTlbJjlx getTTlbJjlxBylxid(String lxid);
	
	/*
	 * 根据分页参数和关键字获取家具类型数据
	 */
	public Pager<TTlbJjlx> getTTlbJjlxs(PageParam page,String name);
	
	/*
	 * 通过家具类型名称获取家具类型实体
	 */
	public TTlbJjlx getTTlbJjlxByLxmc(String lxmc);
	
	/*
	 * 保存家具类型
	 */
	public void saveTTlbJjlx(TTlbJjlx tTlbjjlx);
	
	/*
	 * 获取家具实体
	 */
	public List<TTlbJjlx> getFurnitureTypeList();
}

