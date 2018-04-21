package com.tlb.dao.impl;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbJjDao;
import com.tlb.entity.TTlbJj;

@Component
public class TTlbJjDaoImpl extends BaseDaoImpl<TTlbJj> implements TTlbJjDao {

	public TTlbJj getTTlbShByjjbt(String jjbt) {
		return  this.get("from TTlbJj where sfsc = false and jjbt = ? ", jjbt);
	}

	public Pager<TTlbJj> getTTlbJjs(PageParam page, String name) {
		return this.getForPager("from TTlbJj where sfsc = false and jjbt like ? order by xgsj desc", page, "%" + name + "%");
	}

	public TTlbJj getTTlbJj(String jjid) {
		return this.get(TTlbJj.class, jjid);
	}

	public void saveTTlbJj(TTlbJj tTlbJj) {
		this.saveOrUpdate(tTlbJj);
	}

	public Pager<TTlbJj> getTTlbJjs(PageParam page, String keyword, String lx1, String lx2, String lx3, String lx4) {
		return this.getForPager("from TTlbJj where sfsc = false and (jjbt like ? and jjlx like ? and jjlx like ? and jjlx like ? and jjlx like ?) order by xgsj desc", page, "%" + keyword + "%", "%" + lx1 + "%", "%" + lx2 + "%", "%" + lx3 + "%", "%" + lx4 + "%");
	}
	
}
