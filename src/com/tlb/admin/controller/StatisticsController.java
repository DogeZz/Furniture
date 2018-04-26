package com.tlb.admin.controller;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tlb.admin.service.StatisticsService;

@Controller
@RequestMapping(value = "/admin/statistics.do")
public class StatisticsController {

	@Resource
	private StatisticsService statisticsService;
	
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> model = this.statisticsService.toList();
		return new ModelAndView(model.get("url").toString(),model);
	}
	
	@RequestMapping(params = "datas")
	public String datas(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(defaultValue = "") String name) throws IOException {
		String res = this.statisticsService.getStatisticsDatas(name);
		response.getWriter().print(res);
		return null;		
	}
}
