package com.tlb.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbDdDao;
import com.tlb.entity.TTlbDd;

@Component
public class TTlbDdDaoImpl extends BaseDaoImpl<TTlbDd> implements TTlbDdDao{

	public void saveTTlbDd(TTlbDd tTlbDd) {
		this.saveOrUpdate(tTlbDd);
	}

	public Pager<List<Map<String, Object>>> getTTlbYhListByYhid(PageParam page, String yhid) {
		return this.getForPagerBySql("select a.*, b.jjbt, b.jjtp from t_tlb_dd a, t_tlb_jj b "
				+ "where a.jjid = b.jjid and yhid = ? and a.ddzt != 4 order by a.xgsj desc", page, yhid);
	}

	public TTlbDd getTTlbDd(String ddid) {
		return this.get(TTlbDd.class, ddid);
	}

}
