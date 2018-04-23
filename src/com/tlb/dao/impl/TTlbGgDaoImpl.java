package com.tlb.dao.impl;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbGgDao;
import com.tlb.entity.TTlbGg;

@Component
public class TTlbGgDaoImpl extends BaseDaoImpl<TTlbGg> implements TTlbGgDao {
	
	public Pager<TTlbGg> getTTlbGgs(PageParam page) {
		return this.getForPager("from TTlbGg where sfsc = false", page);
	}
	
	public TTlbGg getTTlbGg(String ggid) {
		return this.get(TTlbGg.class, ggid);
	}

	@Override
	public void saveTTlbGg(TTlbGg tTlbGg) {
		// TODO Auto-generated method stub
		
	}
}
