package com.tlb.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.admin.service.MerchantService;
import com.tlb.common.JsonUtil;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbShDao;
import com.tlb.entity.TTlbSh;

@Component
@SuppressWarnings("unchecked")
public class MerchantServiceImpl implements MerchantService{

	@Resource
	private TTlbShDao tTlbShDao;
	
	@Transactional(readOnly = true)
	public Map<String, Object> toList() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("url", "/pc/admin/merchant/merchant_list");
		return model;
	}

	@Transactional(readOnly = true)
	public String getMerchantDatas(PageParam page, String name) {
		Pager<List<Map<String, Object>>> pager = this.tTlbShDao.getTTlbShs(page, name);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}

	@Transactional(readOnly = true)
	public Map<String, Object> toAdd() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("url", "/pc/admin/merchant/merchant_input");
		return model;
	}
	
	@Transactional(readOnly = true)
	public String checkMerchantnameExist(String merchantname, String shid) {
		TTlbSh tTlbSh = this.tTlbShDao.getTTlbSh(merchantname);
		if (tTlbSh == null) {
			return JsonUtil.toResOfFail("商户已存在");
		} else if (tTlbSh.getShid().equals(shid)){
			return JsonUtil.toResOfFail("商户已存在");
		} else {
			return JsonUtil.toRes("商户不存在");
		}
	}

	@Transactional
	public String saveMerchant(TTlbSh param) {
		TTlbSh tTlbSh = this.tTlbShDao.getTTlbShByShmc(param.getShmc());
		if (param.getShid() == null || param.getShid().equals("")) { //新建商户
			param.setShid(null);
			param.setShzt(true);
			this.tTlbShDao.saveTTlbSh(param);
		} else { //修改商户
			BeanUtils.copyProperties(param, tTlbSh, new String[]{"shid", "cjsj","shzt"});
			this.tTlbShDao.saveTTlbSh(tTlbSh);
		}
		return JsonUtil.toRes("保存成功");
	}

	@Transactional(readOnly = true)
	public Map<String, Object> toEdit(String shid) {
		Map<String, Object> model = new HashMap<String, Object>();
		TTlbSh tTlbSh = this.tTlbShDao.getTTlbSh(shid);
		model.put("data", tTlbSh);
		model.put("url", "/pc/admin/merchant/merchant_input");
		return model;
	}

	@Transactional
	public String deleteMerchant(String shid) {
		TTlbSh tTlbSh = this.tTlbShDao.getTTlbSh(shid);
		tTlbSh.setShzt(false);
		this.tTlbShDao.saveTTlbSh(tTlbSh);
		return JsonUtil.toRes("删除成功");
	}
}