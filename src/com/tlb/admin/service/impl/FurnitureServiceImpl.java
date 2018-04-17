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
public class FurnitureServiceImpl implements FurnitureService {
	
	@Resource
	private TTlbJjDao tTlbJjDao;
	
	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> toList() {
		// TODO Auto-generated method stub
		Map<String,Object> model = new HashMap<String,Object>();
		//TODO 页面位置
		model.put("url", "/pc/admin/furniture/furniture_list");
		return model;
		//return null;
	}

	@Transactional(readOnly = true)
	public String getFurnitureDatas(PageParam page, String name) {
		Pager<TTlbJj> pager = this.tTlbJjDao.getTTlbJjs(page, name);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}

	@Override
	@Transactional
	public Map<String, Object> toAdd() {
		// TODO 页面
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("url", "/pc/admin/furniture/furniture_input");
		return model;
	}

	@Override
	public String saveFurniture(TTlbJj param) {
		// TODO Auto-generated method stub
		TTlbJj tTlbJj = this.tTlbJjDao.getTTlbShByjjm(param.getJjbt());
		/*
		 * 新建家具
		 */
		if(tTlbJj==null&&(param.getJjdj().equals("")||param.getJjid()==null)){
			param.setSfky(true);
			param.setSfsc(false);
			this.tTlbJjDao.saveTTlbJj(param);
		}
		else{
			BeanUtils.copyProperties(param, tTlbJj, new String[]{"shid","cjsj","sfky","sfsc"});
			tTlbJj.setSfky(true);
			tTlbJj.setSfsc(false);
			this.tTlbJjDao.saveTTlbJj(tTlbJj);
		}
		return JsonUtil.toRes("保存成功");
	}

	@Override
	@Transactional(readOnly=true)
	public Map<String, Object> toEdit(String jjid) {
		// TODO Auto-generated method stub
		Map<String,Object> model = new HashMap<String,Object>();
		TTlbJj tTlbJj = this.tTlbJjDao.getTTlbJj(jjid);
		model.put("data", tTlbJj);
		model.put("url", "/pc/admin/furniture/furniture_input");
		return model;
	}

	@Override
	@Transactional(readOnly=true)
	public String deleteFurniture(String jjid) {
		// TODO Auto-generated method stub
		TTlbJj tTlbJj = this.tTlbJjDao.getTTlbJj(jjid);
		tTlbJj.setSfsc(true);
		this.tTlbJjDao.saveTTlbJj(tTlbJj);
		return JsonUtil.toRes("删除成功");
	}

}
