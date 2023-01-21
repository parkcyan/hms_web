package com.groupc.hms;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StaffController {
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

	@RequestMapping(value = "/loginStaff.st")
	public String staffLogin(String id, String pw) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return "default/staff/login";
	}

}
