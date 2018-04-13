package com.tlb.front.service;

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

}
