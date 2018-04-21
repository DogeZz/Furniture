package com.tlb.front.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tlb.common.PageParam;
import com.tlb.entity.TTlbYh;
import com.tlb.front.service.AjaxService;

@Controller
public class AjaxController {

	@Resource 
	private AjaxService ajaxService;
	
	@RequestMapping(value = "/front/login.ajx")
	public String login(HttpServletResponse response, HttpServletRequest request, 
			String username, String password) throws Exception {
		String res = this.ajaxService.getLoginResult(username, password);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/checkUsernameExist.ajx")
	public String checkUsernameExist(HttpServletResponse response, HttpServletRequest request, 
			String username) throws Exception {
		String res = this.ajaxService.toCheckUsernameExist(username);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/saveRegister.ajx")
	public String saveRegister(HttpServletResponse response, HttpServletRequest request, 
			TTlbYh tTlbYh) throws Exception {
		String res = this.ajaxService.toSaveRegister(tTlbYh);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getUser.ajx")
	public String getUser(HttpServletResponse response, HttpServletRequest request, 
			String username) throws Exception {
		String res = this.ajaxService.toGetUser(username);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getShPageData.ajx")
	public String getShListData(HttpServletResponse response, HttpServletRequest request,
			PageParam page, @RequestParam(defaultValue = "") String name) throws Exception {
		String res = this.ajaxService.toGetShPageData(page, name);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getShData.ajx")
	public String getShData(HttpServletResponse response, HttpServletRequest request,
			String shid) throws Exception {
		String res = this.ajaxService.toGetShData(shid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/addToAttention.ajx")
	public String addToAttention(HttpServletResponse response, HttpServletRequest request,
			String yhid, String shid) throws Exception {
		String res = this.ajaxService.addToAttention(yhid, shid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/addToCollection.ajx")
	public String addToCollection(HttpServletResponse response, HttpServletRequest request,
			String yhid, String jjid) throws Exception {
		String res = this.ajaxService.addToCollection(yhid, jjid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getJjPageData.ajx")
	public String getJjPageData(HttpServletResponse response, HttpServletRequest request,
			PageParam page) throws Exception {
		String res = this.ajaxService.getJjPageData(page);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getJjData.ajx")
	public String getJjData(HttpServletResponse response, HttpServletRequest request,
			String jjid) throws Exception {
		String res = this.ajaxService.getJjData(jjid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getDzData.ajx")
	public String getDzData(HttpServletResponse response, HttpServletRequest request,
			String yhid) throws Exception {
		String res = this.ajaxService.getDzData(yhid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/buySubmit.ajx")
	public String buySubmit(HttpServletResponse response, HttpServletRequest request,
			String username, String jjid, int sl, double ze, String dzid) throws Exception {
		String res = this.ajaxService.buySubmit(username, jjid, sl, ze, dzid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getDdPageData.ajx")
	public String getDdPageData(HttpServletResponse response, HttpServletRequest request,
			String username, PageParam page) throws Exception {
		String res = this.ajaxService.getDdPageData(username, page);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toPay.ajx")
	public String toPay(HttpServletResponse response, HttpServletRequest request,
			String ddid) throws Exception {
		String res = this.ajaxService.toPay(ddid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toSign.ajx")
	public String toSign(HttpServletResponse response, HttpServletRequest request,
			String ddid) throws Exception {
		String res = this.ajaxService.toSign(ddid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toDelete.ajx")
	public String toDelete(HttpServletResponse response, HttpServletRequest request,
			String ddid) throws Exception {
		String res = this.ajaxService.toDelete(ddid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getGwcPageData.ajx")
	public String getGwcPageData(HttpServletResponse response, HttpServletRequest request,
			String username, PageParam page) throws Exception {
		String res = this.ajaxService.getGwcPageData(page, username);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/saveBasket.ajx")
	public String saveBasket(HttpServletResponse response, HttpServletRequest request,
			String username, String jjid, int sl) throws Exception {
		String res = this.ajaxService.saveBasket(username, jjid, sl);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getGwcData.ajx")
	public String getGwcData(HttpServletResponse response, HttpServletRequest request,
			String gwcid) throws Exception {
		String res = this.ajaxService.getGwcData(gwcid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toJia.ajx")
	public String toJia(HttpServletResponse response, HttpServletRequest request,
			String gwcid) throws Exception {
		String res = this.ajaxService.toJia(gwcid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toJian.ajx")
	public String toJian(HttpServletResponse response, HttpServletRequest request,
			String gwcid) throws Exception {
		String res = this.ajaxService.toJian(gwcid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toSubmitBilling.ajx")
	public String toSubmitBilling(HttpServletResponse response, HttpServletRequest request,
			String gwcids, String username, String dzid) throws Exception {
		String res = this.ajaxService.toSubmitBilling(gwcids, username, dzid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toDeleteGwc.ajx")
	public String toDeleteGwc(HttpServletResponse response, HttpServletRequest request,
			String gwcid) throws Exception {
		String res = this.ajaxService.toDeleteGwc(gwcid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getTypeJjPageData.ajx")
	public String getTypeJjPageData(HttpServletResponse response, HttpServletRequest request,
			PageParam page, String keyword, String lx1, String lx2, String lx3, String lx4) throws Exception {
		String res = this.ajaxService.getTypeJjPageData(page, lx1, keyword, lx2, lx3, lx4);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/saveInfo.ajx")
	public String saveInfo(HttpServletResponse response, HttpServletRequest request, 
			TTlbYh tTlbYh) throws Exception {
		String res = this.ajaxService.saveInfo(tTlbYh);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/saveUserHead.ajx")
	public String saveUserHead(HttpServletResponse response, HttpServletRequest request, 
			String username, String yhtx) throws Exception {
		String res = this.ajaxService.saveUserHead(username, yhtx);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getDzListData.ajx")
	public String getDzListData(HttpServletResponse response, HttpServletRequest request, 
			String username) throws Exception {
		String res = this.ajaxService.getDzListData(username);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toSetDzDefault.ajx")
	public String toSetDzDefault(HttpServletResponse response, HttpServletRequest request, 
			String dzid) throws Exception {
		String res = this.ajaxService.toSetDzDefault(dzid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toSaveAddr.ajx")
	public String toSaveAddr(HttpServletResponse response, HttpServletRequest request, 
			String username, String dzid, String zsxm, String sjhm, String shdz, boolean sfmr) throws Exception {
		String res = this.ajaxService.toSaveAddr(username, dzid, zsxm, sjhm, shdz, sfmr);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/toDeleteAddr.ajx")
	public String toDeleteAddr(HttpServletResponse response, HttpServletRequest request, 
			String dzid) throws Exception {
		String res = this.ajaxService.toDeleteAddr(dzid);
		response.getWriter().print(res);
		return null;
	}

	@RequestMapping(value = "/front/getScPageData.ajx")
	public String getScPageData(HttpServletResponse response, HttpServletRequest request, 
			PageParam page, String username) throws Exception {
		String res = this.ajaxService.getScPageData(page, username);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(value = "/front/getGwcCount.ajx")
	public String getGwcCount(HttpServletResponse response, HttpServletRequest request, 
			String username) throws Exception {
		String res = this.ajaxService.getGwcCount(username);
		response.getWriter().print(res);
		return null;
	}
}
