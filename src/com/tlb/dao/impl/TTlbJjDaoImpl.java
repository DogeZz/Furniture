package com.tlb.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tlb.common.NullUtils;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbJjDao;
import com.tlb.entity.TTlbJj;

@Component
public class TTlbJjDaoImpl extends BaseDaoImpl<TTlbJj> implements TTlbJjDao {

	public TTlbJj getTTlbShByjjbt(String jjbt) {
		return  this.get("from TTlbJj where sfsc = false and jjbt = ? ", jjbt);
	}

	public Pager<TTlbJj> getTTlbJjs(PageParam page, String name) {
		return this.getForPager("from TTlbJj where sfsc = false and jjbt like ? order by djl desc, xgsj desc", page, "%" + name + "%");
	}

	public TTlbJj getTTlbJj(String jjid) {
		return this.get(TTlbJj.class, jjid);
	}

	public void saveTTlbJj(TTlbJj tTlbJj) {
		this.saveOrUpdate(tTlbJj);
	}

	public Pager<List<Map<String, Object>>> getTTlbJjs(PageParam page, String keyword, String lx1, String lx2, String lx3, String lx4, String yhid) {
		return this.getForPagerBySql("select a.*,b.zt from t_tlb_jj a "
				+ "left join t_tlb_yhsc b on (b.yhid = ? and b.jjid = a.jjid ) where sfsc = 0 and (jjbt like ? and jjlx like ? and jjlx like ? and jjlx like ? and jjlx like ?) order by djl desc, xgsj desc", page, yhid, "%" + keyword + "%", "%" + lx1 + "%", "%" + lx2 + "%", "%" + lx3 + "%", "%" + lx4 + "%");
	}

	public Pager<TTlbJj> getTTlbJjsByDj(PageParam page) {
		return this.getForPager("from TTlbJj where sfsc = false order by jjdj desc, xgsj desc", page);
	}

	public List<Map<String, Object>> getTTlbJjWithYhsc(String jjid, String yhid) {
		if (NullUtils.isEmpty(yhid)) {
			return this.getForMapBySql("select a.* from t_tlb_jj a where sfsc = 0 and a.jjid = ? ", jjid);
		}
		return this.getForMapBySql("select a.*, b.zt from t_tlb_jj a left join t_tlb_yhsc b on (a.jjid = b.jjid and b.yhid = ?) where sfsc = 0 and a.jjid = ? ", yhid, jjid);
	}

	public List<Map<String, Object>> getAllTTlbJjs(String name) {
		return this.getForMapBySql("select * from t_tlb_jj where sfsc = 0 and jjbt like ? ", "%"+ name +"%");
	}
	
}
