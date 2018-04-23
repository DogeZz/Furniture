package com.tlb.dao;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.tlb.entity.TTlbGg;

@Entity
@Table(name = "t_tlb_gg")
public interface TTlbGgDao extends BaseDao<TTlbGg> {
	
	/**
	 * 添加公告.
	 */
	public void saveTTlbGg(TTlbGg tTlbGg);
	
}
