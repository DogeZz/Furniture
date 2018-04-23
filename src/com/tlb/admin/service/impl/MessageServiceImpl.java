package com.tlb.admin.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.admin.service.MessageService;
import com.tlb.common.JsonUtil;
import com.tlb.common.PageParam;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional(readOnly = true)
	public Map<String, Object> toAdd() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("url", "/pc/admin/message/message_input");
		return model;
	}
	
	@Transactional
	public String saveMessage(TTlbGg param) {
//		TTlbGg tTlbGg = new TTlbGg();  //新建公告
//		BeanUtils.copyProperties(param, tTlbGg, new String[]{"ggid","cjsj","sfsc","djl"});
//		this.tTlbGgDao.saveTTlbGg(tTlbGg);
		return JsonUtil.toRes("添加成功");
	}

	@Override
	public Map<String, Object> toEdit(String ggid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteMessage(String ggid) {
		// TODO Auto-generated method stub
		return null;
	}
}
