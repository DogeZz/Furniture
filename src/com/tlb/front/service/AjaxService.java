package com.tlb.front.service;

import com.tlb.common.PageParam;
import com.tlb.entity.TTlbYh;

public interface AjaxService {

	/**
	 * 用户登录.
	 * @param username 用户名
	 * @param password 密码
	 * @return 数据
	 */
	public String getLoginResult(String username, String password);

	/**
	 * 用户注册时检查用户名是否已存在.
	 * @param username 用户名
	 * @return 数据
	 */
	public String toCheckUsernameExist(String username);

	/**
	 * 保存新用户.
	 * @param tTlbYh 用户实体
	 * @return 数据
	 */
	public String toSaveRegister(TTlbYh tTlbYh);

	/**
	 * 获取用户数据.
	 * @param username 用户名
	 * @return 数据
	 */
	public String toGetUser(String username);

	/**
	 * 获取所有商户信息.
	 * @param page 分页参数
	 * @param name 关键字
	 * @return 数据
	 */
	public String toGetShPageData(PageParam page, String name);

	/**
	 * 获取单个商户实体.
	 * @param shid 商户id
	 * @return 数据
	 */
	public String toGetShData(String shid);

	/**
	 * 添加或修改用户关注.
	 * @param yhid 用户id
	 * @param shid 商户id
	 * @return 数据
	 */
	public String addToAttention(String yhid, String shid);

	/**
	 * 添加或修改用户收藏.
	 * @param yhid 用户id
	 * @param jjid 家具id
	 * @return 数据
	 */
	public String addToCollection(String yhid, String jjid);

	/**
	 * 获取家具分页数据.
	 * @param page 分页参数
	 * @return 数据
	 */
	public String getJjPageData(PageParam page);

	/**
	 * 获取指定的家具数据.
	 * @param jjid 家具id
	 * @return 数据
	 */
	public String getJjData(String jjid);

	/**
	 * 获取指定用户的地址数据.
	 * @param yhid 用户id
	 * @return 数据
	 */
	public String getDzData(String yhid);

}
