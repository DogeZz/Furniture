package com.tlb.admin.service;

import java.util.Map;

import com.tlb.common.PageParam;
import com.tlb.entity.TTlbJjlx;

public interface FurnitureTypeService {

	public Map<String, Object> toList();

	public String getFurnitureTypeDatas(PageParam page, String name);

	public String deleteFurnitureType(String lxid);

	public Map<String, Object> toEdit(String lxid);

	public String saveFurnitureType(TTlbJjlx param);

	public String checklxmcExist(String lxmc, String lxid);

	public Map<String, Object> toAdd();

}
