package com.tlb.admin.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.admin.service.MessageService;
import com.tlb.common.JsonUtil;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbGgDao;
import com.tlb.entity.TTlbGg;

@Component
@SuppressWarnings("unchecked")
public class MessageServiceImpl implements MessageService{
	@Resource
	private TTlbGgDao tTlbGgDao;
	
	@Transactional(readOnly = true)
	public Map<String, Object> toList() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("url", "/pc/admin/message/message_list");
		return model;
	}

	@Transactional(readOnly = true)
	public String getMessageDatas(PageParam page, String name) {
		Pager<TTlbGg> pager = this.tTlbGgDao.getTTlbGgs(page, name);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}

	@Transactional(readOnly = true)
	public Map<String, Object> toAdd() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("url", "/pc/admin/message/message_input");
		return model;
	}
	
	@Transactional
	public String saveMessage(TTlbGg param) {
		
		TTlbGg tTlbGg = this.tTlbGgDao.getTTlbGgByGgid(param.getGgid());
		if (tTlbGg == null && (param.getGgid().equals("") || param.getGgid() == null)) { //新建公告
			param.setGgid(null);
			param.setGgbt(param.getGgbt());
			param.setGgnr(param.getGgnr());
			param.setGgsfsc(false);
			this.tTlbGgDao.saveTTlbGg(param);
		} else { //修改用户
			BeanUtils.copyProperties(param, tTlbGg, new String[]{"ggid", "cjsj","ggsfsc"});
			this.tTlbGgDao.saveTTlbGg(tTlbGg);
		}
		return JsonUtil.toRes("保存成功");
	}

	@Transactional
	public Map<String, Object> toEdit(String ggid) {
		Map<String, Object> model = new HashMap<String, Object>();
		TTlbGg tTlbGg = this.tTlbGgDao.getTTlbGgByGgid(ggid);
		model.put("data", tTlbGg);
		model.put("url", "/pc/admin/message/message_input");
		return model;
	}

	@Transactional
	public String deleteMessage(String ggid) {
		TTlbGg tTlbGg = this.tTlbGgDao.getTTlbGgByGgid(ggid);
		tTlbGg.setGgsfsc(true);
		this.tTlbGgDao.saveTTlbGg(tTlbGg);
		return JsonUtil.toRes("删除成功");
	}
}
