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

	/**
	 * 分类搜索页.
	 */
	public Map<String, Object> toType();

	/**
	 * 商店列表页.
	 */
	public Map<String, Object> toMerchantList();

	/**
	 * 商店详细页.
	 */
	public Map<String, Object> toMerchantDetail();
	
	/**
	 * 收货地址.
	 */
	public Map<String, Object> toDeliveryAddress();

	/**
	 * 结算页.
	 */
	public Map<String, Object> toBuy();

	/**
	 * 添加购物车成功页.
	 */
	public Map<String, Object> toBasket();

	/**
	 * 我的订单页.
	 */
	public Map<String, Object> toMyOrder();
	
	/**
	 * 购物车页.
	 */
	public Map<String, Object> toShoppingCart();

	/**
	 * 用户中心页.
	 */
	public Map<String, Object> toUserCenter();

	/**
	 * 收藏页.
	 */
	public Map<String, Object> toMyCollection();
}
