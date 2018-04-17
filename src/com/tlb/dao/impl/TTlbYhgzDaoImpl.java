package com.tlb.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbYhgzDao;
import com.tlb.entity.TTlbYhgz;

@Component
public class TTlbYhgzDaoImpl extends BaseDaoImpl<TTlbYhgz> implements TTlbYhgzDao{

	public Pager<List<Map<String, Object>>> getTTlbYhgzs(PageParam page, String name) {
		return this.getForPagerBySql("select b.yhmc, c.shmc from t_tlb_yhgz a, t_tlb_yh b, t_tlb_sh c " +
				"where a.yhid = b.yhid and a.shid = c.shid and (b.yhmc like ? or c.shmc like ?) and a.zt = 1 order by a.cjsj desc", page, "%" + name + "%", "%" + name + "%");
	}

	public TTlbYhgz getTTlbYhgzByYhidAndShid(String yhid, String shid) {
		return this.get("from TTlbYhgz where yhid = ? and shid = ?", yhid, shid);
	}

	public void saveTTlbYhgz(TTlbYhgz tTlbYhgz) {
		this.saveOrUpdate(tTlbYhgz);
	}

}
