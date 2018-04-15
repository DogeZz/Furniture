package com.tlb.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.common.JsonUtil;
import com.tlb.dao.TTlbShDao;
import com.tlb.dao.TTlbYhDao;
import com.tlb.entity.TTlbSh;
import com.tlb.entity.TTlbYh;
import com.tlb.front.service.AjaxService;

@Component
@SuppressWarnings("unchecked")
public class AjaxServiceImpl implements AjaxService{
	
	@Resource
	private TTlbYhDao tTlbYhDao;
	
	@Resource
	private TTlbShDao tTlbShDao;

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
	public String toGetShListData(String name) {
		List<TTlbSh> list = this.tTlbShDao.getTTlbShs(name);
		if (list != null) {
			return JsonUtil.toString(list);
		}
		return null;
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

}
