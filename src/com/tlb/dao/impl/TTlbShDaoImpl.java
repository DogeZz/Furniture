package com.tlb.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbShDao;
import com.tlb.entity.TTlbSh;

@Component
public class TTlbShDaoImpl extends BaseDaoImpl<TTlbSh> implements TTlbShDao{

	public TTlbSh getTTlbShByShmc(String shmc) {
		TTlbSh tTlbSh = this.get("from TTlbSh where shzt = true and shmc = ? ", shmc);
		return tTlbSh;
	}

	public Pager<List<Map<String, Object>>> getTTlbShs(PageParam page, String name) {
		return this.getForPagerBySql("select a.*, b.yhmc from t_tlb_sh a, t_tlb_yh b " +
				"where a.yhid = b.yhid and a.shmc like ? and a.shzt = 1 and b.yhsfsc = 0 order by cjsj desc", page, "%" + name + "%");
	}

	public TTlbSh getTTlbSh(String shid) {
		return this.get(TTlbSh.class, shid);
	}

	public void saveTTlbSh(TTlbSh tTlbSh) {
		this.saveOrUpdate(tTlbSh);
	}

	public List<TTlbSh> getTTlbShs(String name) {
		return this.find("from TTlbSh where shmc like ? and shzt = true order by shdj desc", "%"+ name +"%");
	}
}
