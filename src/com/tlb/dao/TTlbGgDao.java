package com.tlb.dao;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.entity.TTlbGg;

@Entity
@Table(name = "t_tlb_gg")
public interface TTlbGgDao extends BaseDao<TTlbGg> {
	
	/**
	 * 通过公告id来获取公告实体.
	 */
	public TTlbGg getTTlbGgByGgid(String ggid);
	
	/**
	 * 添加公告.
	 */
	public void saveTTlbGg(TTlbGg tlbGg);

	/**
	 * 获取所有公告.
	 */
	public Pager<TTlbGg> getTTlbGgs(PageParam page,String name);

	/**
	 * 获取最后一个修改的公告.
	 * @return
	 */
	public TTlbGg getTTlbGgByTop();
	
}
