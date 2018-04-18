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
				+ "where b.yhid = a.yhid and a.yhid = ? and a.sfky = 1 order by xgsj desc", yhid);
	}

}
