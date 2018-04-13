package com.tlb.admin.service;

import java.util.Map;

import com.tlb.common.PageParam;
import com.tlb.entity.TTlbSh;

public interface MerchantService {

	/**
	 * 商户列表页索引.
	 * @return 页面
	 */
	public Map<String, Object> toList();

	/**
	 * 获取商户分页数据.
	 * @param page 分页参数
	 * @param name 关键字
	 * @return 数据
	 */
	public String getMerchantDatas(PageParam page, String name);

	/**
	 * 商户添加页索引.
	 * @return 页面
	 */
	public Map<String, Object> toAdd();
	
	/**
	 * 检查商户名是否已存在.
	 * @param shmc 商户名
	 * @param shid 商户id
	 * @return 数据
	 */
	public String checkMerchantnameExist(String shmc, String shid);

	/**
	 * 保存商户.
	 * @param param 商户实体类
	 * @return 数据
	 */
	public String saveMerchant(TTlbSh param);

	/**
	 * 商户修改页索引.
	 * @param shid 商户id
	 * @return 页面  + 数据
	 */
	public Map<String, Object> toEdit(String shid);

	/**
	 * 删除商户.
	 * @param shid 商户id
	 * @return 数据
	 */
	public String deleteMerchant(String shid);
}
