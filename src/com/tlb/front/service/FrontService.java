package com.tlb.front.service;

import java.util.Map;

public interface FrontService {

	/**
	 * 前台主页.
	 */
	public Map<String, Object> toHomePage();

	/**
	 * 登录页.
	 */
	public Map<String, Object> toLogin();

	/**
	 * 注册页.
	 */
	public Map<String, Object> toRegister();


	/**
	 * 个人信息页.
	 */
	public Map<String, Object> toPersonalInfo();

	/**
	 * 商品详细页.
	 */
	public Map<String, Object> toDetail();
}
