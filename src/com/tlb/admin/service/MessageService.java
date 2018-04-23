package com.tlb.admin.service;

import java.util.Map;

import com.tlb.common.PageParam;
import com.tlb.entity.TTlbGg;

public interface MessageService {
	
	/*
	 * 公告列表页索引
	 * @return 页面
	 */
	Map<String, Object> toList();

	/*
	 * 获取公告分页数据
	 * @param page 分页参数
	 * @param name 关键字
	 * @return 数据
	 */
	String getMessageDatas(PageParam page, String name);

	/*
	 * 家具添加页索引
	 * @return 页面
	 */
	Map<String, Object> toAdd();

	/*
	 * 保存家具
	 * @param param 家具实体类
	 * @return 数据
	 */
	String saveMessage(TTlbGg param);

	/*
	 * 家具修改页索引
	 * @param jjid 家具id
	 * @return 页面+数据
	 */
	Map<String, Object> toEdit(String ggid);

	/*
	 * 删除公告
	 * @param jjid 家具id
	 * @return 数据
	 */
	String deleteMessage(String ggid);

}
