package com.tlb.admin.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.admin.service.FurnitureTypeService;
import com.tlb.common.JsonUtil;
import com.tlb.common.NullUtils;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbJjlxDao;
import com.tlb.entity.TTlbJjlx;

@Component
@SuppressWarnings("unchecked")
public class FurnitureTypeServiceImpl implements FurnitureTypeService{
	
	@Resource
	private TTlbJjlxDao tTlbJjlxDao;
	
	@Transactional(readOnly = true)
	public Map<String, Object> toList() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("url", "/pc/admin/furnitureType/furnitureType_list");
		return model;
	}

	@Transactional(readOnly = true)
	public String getFurnitureTypeDatas(PageParam page, String name) {
		Pager<TTlbJjlx> pager = this.tTlbJjlxDao.getTTlbJjlxs(page, name);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}

	@Transactional(readOnly = true)
	public Map<String, Object> toAdd() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("url", "/pc/admin/furnitureType/furnitureType_input");
		return model;
	}
	
	@Transactional(readOnly = true)
	public String checklxmcExist(String lxmc, String lxid) {
		TTlbJjlx tTlbJjlx = this.tTlbJjlxDao.getTTlbJjlxByLxmc(lxmc);
		if (tTlbJjlx == null) {
			return JsonUtil.toResOfFail("类型名称已存在");
		} else if (tTlbJjlx.getLxid().equals(lxid)){
			return JsonUtil.toResOfFail("类型名称已存在");
		} else {
			return JsonUtil.toRes("类型名称不存在");
		}
	}

	@Transactional
	public String saveFurnitureType(TTlbJjlx param) {
		if (NullUtils.isEmpty(param.getLxid())) { 
			param.setLxid(null);
			param.setSfsc(false);
			this.tTlbJjlxDao.saveTTlbJjlx(param);
		} else {
			TTlbJjlx tTlbJjlx = this.tTlbJjlxDao.getTTlbJjlxBylxid(param.getLxid());
			BeanUtils.copyProperties(param, tTlbJjlx, new String[]{"lxid", "cjsj",});
			this.tTlbJjlxDao.saveTTlbJjlx(tTlbJjlx);
		}
		return JsonUtil.toRes("保存成功");
	}

	@Transactional(readOnly = true)
	public Map<String, Object> toEdit(String lxid) {
		Map<String, Object> model = new HashMap<String, Object>();
		TTlbJjlx tTlbJjlx = this.tTlbJjlxDao.getTTlbJjlxBylxid(lxid);
		model.put("data", tTlbJjlx);
		model.put("url", "/pc/admin/furnitureType/furnitureType_input");
		return model;
	}

	@Transactional
	public String deleteFurnitureType(String yhid) {
		TTlbJjlx tTlbJjlx = this.tTlbJjlxDao.getTTlbJjlxBylxid(yhid);
		tTlbJjlx.setSfsc(true);
		this.tTlbJjlxDao.saveTTlbJjlx(tTlbJjlx);
		return JsonUtil.toRes("删除成功");
	}
}
