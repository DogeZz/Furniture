package com.tlb.front.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.tlb.front.service.AjaxService;

@Controller
public class AjaxController {

	@Resource 
	private AjaxService ajaxService;
}
