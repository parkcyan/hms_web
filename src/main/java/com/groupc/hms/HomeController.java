package com.groupc.hms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/staff", method = RequestMethod.GET)
	public String staffHome() {
		return "staff/index";
	}
	
	@RequestMapping(value = "/reception", method = RequestMethod.GET)
	public String recptionHome() {
		return "reception/index";
	}
	
}
