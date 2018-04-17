package com.tlb.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbJjDao;
import com.tlb.entity.TTlbJj;
import com.tlb.entity.TTlbSh;

@Component
public class TTlbJjDaoImpl extends BaseDaoImpl<TTlbJj> implements TTlbJjDao {

	@Override
	public TTlbJj getTTlbShByjjm(String jjbt) {
		TTlbJj tTlbJj = this.get("from TTlbJj where sfky = true and jjm = ? ", jjbt);
		
		return tTlbJj;
	}

	@Override
	public Pager<TTlbJj> getTTlbJjs(PageParam page, String name) {
		// TODO Auto-generated method stub
		//return this.getForPagerBySql("", page, name);
		return null;
		
	}

	@Override
	public TTlbJj getTTlbJj(String jjid) {
		
		return this.get(TTlbJj.class, jjid);
		
	}

	@Override
	public void saveTTlbJj(TTlbJj tTlbJj) {
		
		this.saveOrUpdate(tTlbJj);
		
	}
	
}
