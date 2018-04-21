package com.tlb.dao;

import java.util.List;
import java.util.Map;

import com.tlb.entity.TTlbDz;

public interface TTlbDzDao extends BaseDao<TTlbDz>{

	public List<Map<String, Object>> getTTlbDzsByYhid(String yhid);

	public TTlbDz getTTlbDz(String dzid);

	public TTlbDz getTTlbDdByYhidAndMr(String yhid, boolean b);

	public void saveTTlbDz(TTlbDz tTlbDz);

}
