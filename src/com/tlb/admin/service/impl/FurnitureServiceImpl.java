package com.tlb.admin.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.admin.service.FurnitureService;
import com.tlb.common.JsonUtil;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbJjDao;
import com.tlb.entity.TTlbJj;

@Component
@SuppressWarnings("unchecked")
public class FurnitureServiceImpl implements FurnitureService {
	
	@Resource
	private TTlbJjDao tTlbJjDao;
	
	@Transactional(readOnly = true)
	public Map<String, Object> toList() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("url", "/pc/admin/furniture/furniture_list");
		return model;
	}

	@Transactional(readOnly = true)
	public String getFurnitureDatas(PageParam page, String name) {
		Pager<TTlbJj> pager = this.tTlbJjDao.getTTlbJjs(page, name);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}

	@Transactional(readOnly = true)
	public Map<String, Object> toAdd() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("url", "/pc/admin/furniture/furniture_input");
		return model;
	}

	@Transactional
	public String saveFurniture(TTlbJj param) {
		TTlbJj tTlbJj = this.tTlbJjDao.getTTlbJj(param.getJjid());
		//新建家具
		if(tTlbJj == null && (param.getJjid().equals("") || param.getJjid() == null)){
			param.setJjid(null);
			param.setSfky(true);
			param.setSfsc(false);
			this.tTlbJjDao.saveTTlbJj(param);
		}else{
			BeanUtils.copyProperties(param, tTlbJj, new String[]{"jjid","cjsj","sfsc"});
			this.tTlbJjDao.saveTTlbJj(tTlbJj);
		}
		return JsonUtil.toRes("保存成功");
	}

	@Transactional(readOnly=true)
	public Map<String, Object> toEdit(String jjid) {
		Map<String,Object> model = new HashMap<String,Object>();
		TTlbJj tTlbJj = this.tTlbJjDao.getTTlbJj(jjid);
		model.put("data", tTlbJj);
		model.put("url", "/pc/admin/furniture/furniture_input");
		return model;
	}

	@Transactional
	public String deleteFurniture(String jjid) {
		TTlbJj tTlbJj = this.tTlbJjDao.getTTlbJj(jjid);
		tTlbJj.setSfsc(true);
		this.tTlbJjDao.saveTTlbJj(tTlbJj);
		return JsonUtil.toRes("删除成功");
	}

}
