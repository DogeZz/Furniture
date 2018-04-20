package com.tlb.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbJjlxDao;
import com.tlb.entity.TTlbJjlx;

@Component
public class TTlbJjlxDaoImpl extends BaseDaoImpl<TTlbJjlx> implements TTlbJjlxDao{
	
	public TTlbJjlx getTTlbJjlxBylxid(String lxid) {
		return this.get(TTlbJjlx.class, lxid);
	}
	
	public Pager<TTlbJjlx> getTTlbJjlxs(PageParam page, String name) {
		return this.getForPager("from TTlbJjlx where sfsc = false and lxmc like ? order by xgsj desc", page, "%" + name + "%");
		
	}
	
	public TTlbJjlx getTTlbJjlxByLxmc(String lxmc) {
		return this.get("from TTlbJjlx where sfsc = false and lxmc = ?", lxmc);
		
	}

	public void saveTTlbJjlx(TTlbJjlx tTlbjjlx) {
		this.saveOrUpdate(tTlbjjlx);
	}

	
	public List<TTlbJjlx> getFurnitureTypeList() {
		return this.find("from TTlbJjlx where sfsc = false order by dj desc");
		
	}
	
}
