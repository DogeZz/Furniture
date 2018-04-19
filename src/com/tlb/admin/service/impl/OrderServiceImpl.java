package com.tlb.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.admin.service.OrderService;
import com.tlb.common.JsonUtil;
import com.tlb.common.NullUtils;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbDdDao;
import com.tlb.entity.TTlbDd;

@Component
@SuppressWarnings("unchecked")
public class OrderServiceImpl implements OrderService{

	@Resource
	private TTlbDdDao tTlbDdDao;
	
	@Transactional(readOnly = true)
	public Map<String, Object> toList() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("url", "/pc/admin/order/order_list");
		return model;
	}

	@Transactional(readOnly = true)
	public String getOrderDatas(PageParam page, String name) {
		Pager<List<Map<String, Object>>> pager = this.tTlbDdDao.getTTlbDds(page, name);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}

	
	@Transactional
	public String saveOrder(String ddid) {
		if (NullUtils.isNotEmpty(ddid)) {
			TTlbDd tTlbDd = this.tTlbDdDao.getTTlbDd(ddid);
			if (tTlbDd != null) {
				tTlbDd.setDdzt(2);
				this.tTlbDdDao.saveTTlbDd(tTlbDd);
			}
		}
		return JsonUtil.toRes("发货成功");
	}

}
