package com.tlb.admin.service;

import java.util.Map;

import com.tlb.common.PageParam;
import com.tlb.entity.TTlbJj;

public interface FurnitureService {
	
	/*
	 * 家具列表页索引
	 * @return 页面
	 */
	public Map<String,Object> toList();
	
	/*
	 * 获取家具分页数据
	 * @param page 分页参数
	 * @param name 关键字
	 * @return 数据
	 */
	public String getFurnitureDatas(PageParam page,String name);
	
	/*
	 * 家具添加页索引
	 * @return 页面
	 */
	public Map<String, Object> toAdd();
	
	/*
	 * 保存家具
	 * @param param 家具实体类
	 * @return 数据
	 */
	public String saveFurniture(TTlbJj param);
	
	/*
	 * 家具修改页索引
	 * @param jjid 家具id
	 * @return 页面+数据
	 */
	public Map<String,Object> toEdit(String jjid);
	
	/*
	 * 删除家具
	 * @param jjid 家具id
	 * @return 数据
	 * 
	 */
	public String deleteFurniture(String jjid);
	
}
