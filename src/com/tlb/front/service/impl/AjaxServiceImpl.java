package com.tlb.front.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.common.JsonUtil;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbShDao;
import com.tlb.dao.TTlbYhDao;
import com.tlb.dao.TTlbYhgzDao;
import com.tlb.dao.TTlbYhscDao;
import com.tlb.entity.TTlbSh;
import com.tlb.entity.TTlbYh;
import com.tlb.entity.TTlbYhgz;
import com.tlb.entity.TTlbYhsc;
import com.tlb.front.service.AjaxService;

@Component
@SuppressWarnings("unchecked")
public class AjaxServiceImpl implements AjaxService{
	
	@Resource
	private TTlbYhDao tTlbYhDao;
	
	@Resource
	private TTlbShDao tTlbShDao;
	
	@Resource
	private TTlbYhgzDao tTlbYhgzDao;
	
	@Resource
	private TTlbYhscDao tTlbYhscDao;

	@Transactional(readOnly = true)
	public String getLoginResult(String username, String password) {
		if (!(username.equals("") || username == null)) {
			TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(username);
			if (tTlbYh != null) {
				Md5PasswordEncoder encoder = new Md5PasswordEncoder();
				if (tTlbYh.getPassword().equals(encoder.encodePassword(password, username))) {
					return JsonUtil.toRes("登录成功");
				} else {
					return JsonUtil.toResOfFail("账号或密码错误");
				}
			}
		}
		return JsonUtil.toResOfFail("账号或密码错误");
	}

	@Transactional(readOnly = true)
	public String toCheckUsernameExist(String username) {
		TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(username);
		if (tTlbYh == null) {
			return JsonUtil.toRes("用户名不存在");
		} else {
			return JsonUtil.toResOfFail("用户名已存在");
		}
	}

	@Transactional(readOnly = true)
	public String toSaveRegister(TTlbYh tTlbYh) {
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();
		tTlbYh.setYhid(null);
		tTlbYh.setYhlx("1");
		tTlbYh.setYhsfsc(false);
		tTlbYh.setIsAccountEnabled(true);
		tTlbYh.setIsAccountExpired(false);
		tTlbYh.setIsAccountLocked(false);
		tTlbYh.setIsCredentialsExpired(false);
		tTlbYh.setLoginFailureCount(0);
		tTlbYh.setPassword(encoder.encodePassword(tTlbYh.getPassword(), tTlbYh.getUsername()));
		this.tTlbYhDao.saveTTlbYh(tTlbYh);
		return JsonUtil.toRes("保存成功");
	}

	@Transactional(readOnly = true)
	public String toGetUser(String username) {
		TTlbYh tTlbYh = tTlbYhDao.getTTlbYh(username);
		return JsonUtil.toStringFromObject(tTlbYh);
	}

	@Transactional(readOnly = true)
	public String toGetShPageData(PageParam page, String name) {
		Pager<List<Map<String, Object>>> pager = this.tTlbShDao.getTTlbShs(page, name);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}
	
	@Transactional(readOnly = true)
	public String toGetShData(String shid) {
		TTlbSh tTlbSh = this.tTlbShDao.getTTlbSh(shid);
		if (tTlbSh != null) {
			tTlbSh.setShdjl(tTlbSh.getShdjl() + 1);
			this.tTlbShDao.saveTTlbSh(tTlbSh);
			return JsonUtil.toStringFromObject(tTlbSh);
		}
		return null;
	}

	@Transactional
	public String addToAttention(String yhid, String shid) {
		TTlbYhgz tTlbYhgz = this.tTlbYhgzDao.getTTlbYhgzByYhidAndShid(yhid, shid);
		if (tTlbYhgz == null) { //新建
			tTlbYhgz = new TTlbYhgz();
			tTlbYhgz.setYhid(yhid);
			tTlbYhgz.setShid(shid);
			tTlbYhgz.setZt(true);
			this.tTlbYhgzDao.saveTTlbYhgz(tTlbYhgz);
		} else {
			if (!tTlbYhgz.getZt()) {
				tTlbYhgz.setZt(true);
				this.tTlbYhgzDao.saveTTlbYhgz(tTlbYhgz);
			}
		}
		return JsonUtil.toRes("关注成功");
	}

	@Transactional
	public String addToCollection(String yhid, String jjid) {
		TTlbYhsc tTlbYhsc = this.tTlbYhscDao.getTTlbYhscByYhidAndJjid(yhid, jjid);
		if (tTlbYhsc == null) { //新建
			tTlbYhsc = new TTlbYhsc();
			tTlbYhsc.setYhid(yhid);
			tTlbYhsc.setJjid(jjid);
			tTlbYhsc.setZt(true);
			this.tTlbYhscDao.saveTTlbYhsc(tTlbYhsc);
		} else {
			if (!tTlbYhsc.getZt()) {
				tTlbYhsc.setZt(true);
				this.tTlbYhscDao.saveTTlbYhsc(tTlbYhsc);
			}
		}
		return JsonUtil.toRes("关注成功");
	}

}
