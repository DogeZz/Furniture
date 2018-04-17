package com.tlb.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbYhscDao;
import com.tlb.entity.TTlbYhsc;

@Component
public class TTlbYhscDaoImpl extends BaseDaoImpl<TTlbYhsc> implements TTlbYhscDao{

	public Pager<List<Map<String, Object>>> getTTlbYhscs(PageParam page, String name) {
		return this.getForPagerBySql("select b.yhmc, c.jjmc from t_tlb_yhsc a, t_tlb_yh b, t_tlb_jj c " +
				"where a.yhid = b.yhid and a.jjid = c.jjid and (b.yhmc like ? or c.jjmc like ?) and a.zt = 1 order by a.cjsj desc", page, "%" + name + "%", "%" + name + "%");
	}

	public void saveTTlbYhsc(TTlbYhsc tTlbYhsc) {
		this.saveOrUpdate(tTlbYhsc);
	}

	public TTlbYhsc getTTlbYhscByYhidAndJjid(String yhid, String jjid) {
		return this.get("from TTlbYhsc where yhid = ? and jjid = ? ", yhid, jjid);
	}

}
