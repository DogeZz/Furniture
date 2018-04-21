package com.tlb.front.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tlb.common.JsonUtil;
import com.tlb.common.NullUtils;
import com.tlb.common.PageParam;
import com.tlb.common.Pager;
import com.tlb.dao.TTlbDdDao;
import com.tlb.dao.TTlbDzDao;
import com.tlb.dao.TTlbGwcDao;
import com.tlb.dao.TTlbJjDao;
import com.tlb.dao.TTlbShDao;
import com.tlb.dao.TTlbYhDao;
import com.tlb.dao.TTlbYhgzDao;
import com.tlb.dao.TTlbYhscDao;
import com.tlb.entity.TTlbDd;
import com.tlb.entity.TTlbGwc;
import com.tlb.entity.TTlbJj;
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
	
	@Resource
	private TTlbJjDao tTlbJjDao;
	
	@Resource
	private TTlbDzDao tTlbDzDao;
	
	@Resource
	private TTlbDdDao tTlbDdDao;
	
	@Resource
	private TTlbGwcDao tTlbGwcDao;

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
	public String addToCollection(String username, String jjid) {
		TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(username);
		if (tTlbYh != null) {
			TTlbYhsc tTlbYhsc = this.tTlbYhscDao.getTTlbYhscByYhidAndJjid(tTlbYh.getYhid(), jjid);
			if (tTlbYhsc == null) { //新建
				tTlbYhsc = new TTlbYhsc();
				tTlbYhsc.setYhid(tTlbYh.getYhid());
				tTlbYhsc.setJjid(jjid);
				tTlbYhsc.setZt(true);
				this.tTlbYhscDao.saveTTlbYhsc(tTlbYhsc);
			} else {
				if (!tTlbYhsc.getZt()) {
					tTlbYhsc.setZt(true);
					this.tTlbYhscDao.saveTTlbYhsc(tTlbYhsc);
				}
			}
		}
		return JsonUtil.toRes("收藏成功");
	}

	@Transactional(readOnly = true)
	public String getJjPageData(PageParam page) {
		Pager<TTlbJj> pager = this.tTlbJjDao.getTTlbJjs(page, "");
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}

	@Transactional
	public String getJjData(String jjid) {
		TTlbJj tTlbJj = this.tTlbJjDao.getTTlbJj(jjid);
		if (tTlbJj != null) {
			tTlbJj.setDjl(tTlbJj.getDjl() + 1);
			this.tTlbJjDao.saveTTlbJj(tTlbJj);
			return JsonUtil.toStringFromObject(tTlbJj);
		}
		return null;
	}

	@Transactional(readOnly = true)
	public String getDzData(String yhid) {
		TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(yhid);
		List<Map<String, Object>> map = this.tTlbDzDao.getTTlbDzsByYhid(tTlbYh.getYhid());
		return JsonUtil.toString(map);
	}

	@Transactional
	public String buySubmit(String username, String jjid, int sl, double ze, String dzid) {
		Date date = new Date();
		TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(username);
		TTlbDd tTlbDd = new TTlbDd();
		tTlbDd.setYhid(tTlbYh.getYhid());
		tTlbDd.setJjid(jjid);
		tTlbDd.setSl(sl);
		tTlbDd.setZe(ze);
		tTlbDd.setDzid(dzid);
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();
		tTlbDd.setSszb(encoder.encodePassword(String.valueOf(date.getTime()), username));
		this.tTlbDdDao.saveTTlbDd(tTlbDd);
		return JsonUtil.toRes("订单成功");
	}

	@Transactional(readOnly = true)
	public String getDdPageData(String username, PageParam page) {
		TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(username);
		Pager<List<Map<String, Object>>> pager = this.tTlbDdDao.getTTlbYhListByYhid(page, tTlbYh.getYhid());
		return JsonUtil.toString(pager.putMapObject());
	}

	@Transactional
	public String toPay(String ddid) {
		TTlbDd tTlbDd = this.tTlbDdDao.getTTlbDd(ddid);
		if (tTlbDd != null) {
			TTlbJj tTlbJj = this.tTlbJjDao.getTTlbJj(tTlbDd.getJjid());
			if (tTlbJj.getJjsl() - tTlbDd.getSl() >= 0) {
				tTlbJj.setJjsl(tTlbJj.getJjsl() - tTlbDd.getSl());
				this.tTlbJjDao.saveTTlbJj(tTlbJj);
			}else {
				return JsonUtil.toRes("手速太慢，商品已售完！");
			}
			tTlbDd.setDdzt(1);
			this.tTlbDdDao.saveTTlbDd(tTlbDd);
		}
		return JsonUtil.toRes("付款成功");
	}

	@Transactional
	public String toSign(String ddid) {
		TTlbDd tTlbDd = this.tTlbDdDao.getTTlbDd(ddid);
		if (tTlbDd != null) {
			tTlbDd.setDdzt(3);
			this.tTlbDdDao.saveTTlbDd(tTlbDd);
		}
		return JsonUtil.toRes("签收成功");
	}
	
	@Transactional
	public String toDelete(String ddid) {
		TTlbDd tTlbDd = this.tTlbDdDao.getTTlbDd(ddid);
		if (tTlbDd != null) {
			tTlbDd.setDdzt(4);
			this.tTlbDdDao.saveTTlbDd(tTlbDd);
		}
		return JsonUtil.toRes("删除成功");
	}
	
	@Transactional(readOnly = true)
	public String getGwcPageData(PageParam page, String username) {
		TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(username);
		Pager<List<Map<String, Object>>> pager = this.tTlbGwcDao.getTTlbGwcs(page, tTlbYh.getYhid());
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}
	
	@Transactional
	public String saveBasket(String username, String jjid, int sl) {
		TTlbGwc tTlbGwc = this.tTlbGwcDao.getTTlbGwcByJjid(jjid);
		if (tTlbGwc == null) {
			TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(username);
			tTlbGwc = new TTlbGwc();
			tTlbGwc.setYhid(tTlbYh.getYhid());
			tTlbGwc.setJjid(jjid);
			tTlbGwc.setSl(sl);
			tTlbGwc.setZt(0);
			this.tTlbGwcDao.saveTTlbGwc(tTlbGwc);
		} else {
			tTlbGwc.setSl(tTlbGwc.getSl() + sl);
			this.tTlbGwcDao.saveTTlbGwc(tTlbGwc);
		}
		return JsonUtil.toRes("添加成功", tTlbGwc.getGwcid());
	}

	@Transactional(readOnly = true)
	public String getGwcData(String gwcid) {
		List<Map<String, Object>> list = this.tTlbGwcDao.getTTlbGwcForMap(gwcid);
		if (list.size() != 0) {
			return JsonUtil.toStringFromObject(list.get(0));
		}
		return null;
	}

	@Transactional
	public String toJia(String gwcid) {
		TTlbGwc tTlbGwc = this.tTlbGwcDao.getTTlbGwc(gwcid);
		if (tTlbGwc != null) {
			tTlbGwc.setSl(tTlbGwc.getSl() + 1);
			this.tTlbGwcDao.saveTTlbGwc(tTlbGwc);
		}
		return JsonUtil.toStringFromObject(tTlbGwc);
	}

	@Transactional
	public String toJian(String gwcid) {
		TTlbGwc tTlbGwc = this.tTlbGwcDao.getTTlbGwc(gwcid);
		if (tTlbGwc != null) {
			tTlbGwc.setSl(tTlbGwc.getSl() - 1);
			this.tTlbGwcDao.saveTTlbGwc(tTlbGwc);
		}
		return JsonUtil.toStringFromObject(tTlbGwc);
	}

	@Transactional
	public String toSubmitBilling(String gwcids, String username, String dzid) {
		Date date = new Date();
		boolean flag = false;
		TTlbYh tTlbYh = this.tTlbYhDao.getTTlbYh(username);
		String[] gwcidss = gwcids.split("、");
		for (String gwcid : gwcidss) {
			TTlbDd tTlbDd = new TTlbDd();
			if (NullUtils.isNotEmpty(gwcid)) {
				TTlbGwc tTlbGwc = this.tTlbGwcDao.getTTlbGwc(gwcid);
				if (tTlbGwc != null) {
					TTlbJj tTlbJj = this.tTlbJjDao.getTTlbJj(tTlbGwc.getJjid());
					if (tTlbJj.getJjsl() - tTlbGwc.getSl() >= 0) {
						tTlbJj.setJjsl(tTlbJj.getJjsl() - tTlbGwc.getSl());
						this.tTlbJjDao.saveTTlbJj(tTlbJj);
						tTlbDd.setDdzt(1);
						tTlbDd.setJjid(tTlbGwc.getJjid());
						tTlbDd.setSl(tTlbGwc.getSl());
						tTlbDd.setYhid(tTlbYh.getYhid());
						tTlbDd.setZe(tTlbGwc.getSl() * tTlbJj.getJjjg());
						tTlbDd.setDzid(dzid);
						Md5PasswordEncoder encoder = new Md5PasswordEncoder();
						tTlbDd.setSszb(encoder.encodePassword(String.valueOf(date.getTime()), username));
						this.tTlbDdDao.saveTTlbDd(tTlbDd);
						tTlbGwc.setZt(1);
						this.tTlbGwcDao.saveTTlbGwc(tTlbGwc);
					}else {
						flag = true;
					}
				}
			}
		}
		if(flag){
			return JsonUtil.toRes("库存不足");
		}
		return JsonUtil.toRes("结算成功");
	}

	@Transactional
	public String toDeleteGwc(String gwcid) {
		if (NullUtils.isNotEmpty(gwcid)) {
			TTlbGwc tTlbGwc = this.tTlbGwcDao.getTTlbGwc(gwcid);
			tTlbGwc.setZt(2);
			this.tTlbGwcDao.saveTTlbGwc(tTlbGwc);
		}
		return JsonUtil.toRes("删除成功");
	}

	@Transactional(readOnly = true)
	public String getTypeJjPageData(PageParam page, String lx1, String keyword, String lx2, String lx3, String lx4) {
		Pager<TTlbJj> pager = this.tTlbJjDao.getTTlbJjs(page, keyword, lx1, lx2, lx3, lx4);
		return JsonUtil.toStringFromObject(pager.putMapObject());
	}
	
}
