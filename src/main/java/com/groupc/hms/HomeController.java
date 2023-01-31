package com.groupc.hms;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/index.ad", method = RequestMethod.GET)
	public String adminHome(HttpSession session, Model model) {
		return "admin/staff/list";
	}
	
	@RequestMapping(value = "/index.st", method = RequestMethod.GET)
	public String staffHome(HttpSession session, Model model) {
		session.setAttribute("title", "");
		return "staff/index";
	}
	
	@RequestMapping(value = "/index.re", method = RequestMethod.GET)
	public String recptionHome() {
		return "reception/index";
	}

}
