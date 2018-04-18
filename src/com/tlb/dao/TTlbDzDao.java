package com.tlb.dao;

import java.util.List;
import java.util.Map;

import com.tlb.entity.TTlbDz;

public interface TTlbDzDao extends BaseDao<TTlbDz>{

	public List<Map<String, Object>> getTTlbDzsByYhid(String yhid);

}
