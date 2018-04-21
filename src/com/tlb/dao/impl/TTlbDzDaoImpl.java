package com.tlb.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tlb.dao.TTlbDzDao;
import com.tlb.entity.TTlbDz;

@Component
public class TTlbDzDaoImpl extends BaseDaoImpl<TTlbDz> implements TTlbDzDao{

	public List<Map<String, Object>> getTTlbDzsByYhid(String yhid) {
		return this.getForMapBySql("select a.*, b.zsxm, b.sjhm from t_tlb_dz a, t_tlb_yh b "
				+ "where b.yhid = a.yhid and a.yhid = ? and a.sfky = 1 order by sfmr desc, xgsj desc", yhid);
	}

	public TTlbDz getTTlbDz(String dzid) {
		return this.get(TTlbDz.class, dzid);
	}
	
	public TTlbDz getTTlbDdByYhidAndMr(String yhid, boolean flag) {
		return this.get("from TTlbDz where sfmr = ? and yhid = ? ", flag, yhid);
	}

	public void saveTTlbDz(TTlbDz tTlbDz) {
		this.saveOrUpdate(tTlbDz);
	}

}
