package com.groupc.hms;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

	@RequestMapping(value = "/qr.ad")
	public String qr() {
	
		return "admin/qr/qr";
	}
	
}
