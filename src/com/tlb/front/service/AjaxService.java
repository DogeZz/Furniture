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
	 * @param username 
	 * @return 数据
	 */
	public String getJjData(String jjid, String username);

	/**
	 * 获取指定用户的地址数据.
	 * @param yhid 用户id
	 * @return 数据
	 */
	public String getDzData(String yhid);

	/**
	 * 生成订单.
	 * @param username
	 * @param jjid
	 * @param sl
	 * @param ze
	 * @param dzid 
	 * @return
	 */
	public String buySubmit(String username, String jjid, int sl, double ze, String dzid);

	/**
	 * 订单数据.
	 * @param username
	 * @param page 
	 * @param zt 
	 * @return
	 */
	public String getDdPageData(String username, PageParam page, Integer zt);

	/**
	 * 用户付款订单.
	 * @param ddid
	 * @return
	 */
	public String toPay(String ddid);

	/**
	 * 用户签收订单.
	 * @param ddid
	 * @return
	 */
	public String toSign(String ddid);

	/**
	 * 用户删除订单.
	 * @param ddid
	 * @return
	 */
	public String toDelete(String ddid);

	/**
	 * 购物车数据.
	 * @param page
	 * @param username
	 * @return
	 */
	public String getGwcPageData(PageParam page, String username);

	/**
	 * 添加到购物车.
	 * @param username
	 * @param jjid
	 * @param sl
	 * @return
	 */
	public String saveBasket(String username, String jjid, int sl);

	/**
	 * 获取单个购物车数据.
	 * @param gwcid
	 * @return
	 */
	public String getGwcData(String gwcid);

	/**
	 * 指定的购物车数量加一.
	 * @param gwcid
	 * @return
	 */
	public String toJia(String gwcid);

	/**
	 * 指定的购物车数量减一.
	 * @param gwcid
	 * @return
	 */
	public String toJian(String gwcid);

	/**
	 * 购物车结算.
	 * @param gwcids
	 * @param username
	 * @param dzid 
	 * @return
	 */
	public String toSubmitBilling(String gwcids, String username, String dzid);

	/**
	 * 删除购物车.
	 * @param gwcid
	 * @return
	 */
	public String toDeleteGwc(String gwcid);

	public String getTypeJjPageData(PageParam page, String lx1, String keyword, String lx2, String lx3, String lx4, String username);

	/**
	 * 修改用户信息.
	 * @param tTlbYh 用户
	 * @return 数据
	 */
	public String saveInfo(TTlbYh tTlbYh);

	/**
	 * 获取用户所有地址.
	 * @param username
	 * @return
	 */
	public String getDzListData(String username);

	/**
	 * 设置地址默认.
	 * @param dzid
	 * @return
	 */
	public String toSetDzDefault(String dzid);

	/**
	 * 保存或修改收货地址.
	 * @param username
	 * @param dzid
	 * @param zsxm
	 * @param sjhm
	 * @param shdz
	 * @param sfmr
	 * @return
	 */
	public String toSaveAddr(String username, String dzid, String zsxm, String sjhm, String shdz, boolean sfmr);

	/**
	 * 删除地址.
	 * @param dzid
	 * @return
	 */
	public String toDeleteAddr(String dzid);

	/**
	 * 获取用户收藏.
	 * @param page
	 * @param username
	 * @return
	 */
	public String getScPageData(PageParam page, String username);

	/**
	 * 获取指定用户的购物车数量.
	 * @param username
	 * @return
	 */
	public String getGwcCount(String username);

	/**
	 * 保存用户头像.
	 * @param username
	 * @param yhtx
	 * @return
	 */
	public String saveUserHead(String username, String yhtx);

	/**
	 * 修改密码.
	 * @param username
	 * @param jmm
	 * @param xmm
	 * @return
	 */
	public String toChangePwd(String username, String jmm, String xmm);

	/**
	 * 获取轮播图数据.
	 * @param page
	 * @return
	 */
	public String getLbtData(PageParam page);

	/**
	 * 获取所有类型数据.
	 * @return
	 */
	public String getTypeListData();

	/**
	 * 获取公告数据.
	 * @return
	 */
	public String getGgData();

	public String delToCollection(String yhid, String jjid);

}
