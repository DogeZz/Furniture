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

	public Pager<List<Map<String, Object>>> getTTlbDdListByYhid(PageParam page, String yhid, Integer zt) {
		if (zt == 100) {
			return this.getForPagerBySql("select a.*, b.jjbt, b.jjtp, c.shr,c.shsjhm, c.shdz from t_tlb_dd a, t_tlb_jj b, t_tlb_dz c "
					+ "where a.jjid = b.jjid and a.dzid = c.dzid and a.yhid = ? and a.ddzt != 4 order by a.cjsj desc", page, yhid);
		}else {
			return this.getForPagerBySql("select a.*, b.jjbt, b.jjtp, c.shr,c.shsjhm, c.shdz from t_tlb_dd a, t_tlb_jj b, t_tlb_dz c "
					+ "where a.jjid = b.jjid and a.dzid = c.dzid and a.yhid = ? and a.ddzt = ? order by a.cjsj desc", page, yhid, zt);
		}
	}

	public TTlbDd getTTlbDd(String ddid) {
		return this.get(TTlbDd.class, ddid);
	}

	public Pager<List<Map<String, Object>>> getTTlbDds(PageParam page, String name) {
		return this.getForPagerBySql("select a.*, b.jjbt, b.jjtp, c.zsxm from t_tlb_dd a, t_tlb_jj b, t_tlb_yh c "
				+ "where a.jjid = b.jjid and a.yhid = c.yhid and ( b.jjbt like ? or c.zsxm like ?) order by a.cjsj desc", page, "%" + name + "%", "%" + name + "%");
	}

	public int getCountByJjid(String jjid) {
		return this.count("from TTlbDd where jjid = ? and (ddzt = 3 or ddzt = 4) ", jjid);
	}

}
