package com.tlb.admin.service.impl;

import java.text.Collator;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.admin.service.StatisticsService;
import com.tlb.common.JsonUtil;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbDdDao;
import com.tlb.dao.TTlbJjDao;
import com.tlb.dao.TTlbJjlxDao;
import com.tlb.entity.TTlbJj;

@Component
public class StatisticsServiceImpl implements StatisticsService{

	@Resource
	private TTlbDdDao tTlbDdDao;
	
	@Resource
	private TTlbJjDao tTlbJjDao;
	
	@Transactional(readOnly = true)
	public Map<String, Object> toList() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("url", "/pc/admin/statistics/statistics_list");
		return model;
	}

	@Transactional(readOnly = true)
	public String getStatisticsDatas(String name) {
		List<Map<String, Object>> list = this.tTlbJjDao.getAllTTlbJjs(name);
		for (Map<String, Object> map : list) {
			int count = this.tTlbDdDao.getCountByJjid(map.get("jjid").toString());
			map.put("xsl", count);
		}
		listSort(list);
		return JsonUtil.toString(list);
	}
	
	 public static void listSort(List<Map<String, Object>> resultList) {  
        Collections.sort(resultList, new Comparator<Map<String, Object>>() {  
            public int compare(Map<String, Object> o1, Map<String, Object> o2) {
                Integer xsl1 = MapUtils.getInteger(o1, "xsl");
                Integer xsl2 = MapUtils.getInteger(o2, "xsl");
                return xsl2 - xsl1;  
            }  
        });  
    }  
}
