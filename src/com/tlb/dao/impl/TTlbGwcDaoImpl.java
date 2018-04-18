package com.tlb.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbGwcDao;
import com.tlb.entity.TTlbGwc;

@Component
public class TTlbGwcDaoImpl extends BaseDaoImpl<TTlbGwc> implements TTlbGwcDao{

	public Pager<List<Map<String, Object>>> getTTlbGwcs(PageParam page, String yhid) {
		return this.getForPagerBySql("select a.*,b.jjbt,b.jjtp,b.jjjg from t_tlb_gwc a, t_tlb_jj b , t_tlb_yh c "
				+ "where a.jjid = b.jjid and c.yhid = ? order by xgsj desc", page, yhid);
	}

	public void saveTTlbGwc(TTlbGwc tTlbGwc) {
		this.saveOrUpdate(tTlbGwc);
	}

	public List<Map<String, Object>> getTTlbGwcForMap(String gwcid){
		return this.getForMapBySql("select a.*,b.jjtp, b.jjbt from t_tlb_gwc a, t_tlb_jj b "
				+ "where a.jjid = b.jjid and a.gwcid = ? and a.zt != 2 ", gwcid);
	}

	public TTlbGwc getTTlbGwcByJjid(String jjid) {
		return this.get("from TTlbGwc where jjid = ? and zt = 0", jjid);
	}

}
