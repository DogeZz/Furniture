package com.tlb.dao.impl;

import org.springframework.stereotype.Component;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbGgDao;
import com.tlb.entity.TTlbGg;

@Component
public class TTlbGgDaoImpl extends BaseDaoImpl<TTlbGg> implements TTlbGgDao {
	
	public void saveTTlbGg(TTlbGg tTlbGg) {
		this.saveOrUpdate(tTlbGg);
	}

	public TTlbGg getTTlbGgByGgid(String ggid) {
		return this.get(TTlbGg.class, ggid);
	}
	
	public Pager<TTlbGg> getTTlbGgs(PageParam page,String name) {
		return this.getForPager("from TTlbGg where ggsfsc = false and ggbt like ? order by xgsj desc ", page, "%"+name+"%");
	}

	public TTlbGg getTTlbGgByTop() {
		return this.get("from TTlbGg where ggsfsc = false order by xgsj desc");
	}
}
