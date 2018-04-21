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
		return this.getForPagerBySql("select a.*,b.jjbt,b.jjtp,b.jjjg,c.zsxm from t_tlb_gwc a, t_tlb_jj b , t_tlb_yh c "
				+ "where a.jjid = b.jjid and c.yhid = ? and a.zt = 0 order by cjsj desc", page, yhid);
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

	public TTlbGwc getTTlbGwc(String gwcid) {
		return this.get(TTlbGwc.class, gwcid);
	}

	public Pager<List<Map<String, Object>>> getTTlbGwcsByName(PageParam page, String name) {
		return this.getForPagerBySql("select a.*,b.jjbt,b.jjtp,b.jjjg,c.zsxm from t_tlb_gwc a, t_tlb_jj b , t_tlb_yh c "
				+ "where a.jjid = b.jjid and a.yhid = c.yhid and a.zt = 0 and (b.jjbt like ? or c.zsxm like ?) order by cjsj desc", page, "%" + name + "%", "%" + name + "%");
	}

	public int getTTlbGwcCountByYhid(String yhid) {
		return this.count("from TTlbGwc where yhid = ? and zt = 0", yhid);
	}

}
