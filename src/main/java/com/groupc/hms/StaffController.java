package com.groupc.hms;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import staff.StaffService;
import staff.vo.StaffVO;

@Controller
public class StaffController {
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	@Autowired
	private StaffService service;

	@ResponseBody @RequestMapping(value = "/loginStaff.st")
	public boolean loginStaff(HttpSession session, String id, String pw) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		StaffVO vo = service.login_staff(map);
		session.setAttribute("loginInfo", vo);
		return service.login_staff(map) != null;
	}
	
	@RequestMapping(value = "/logoutStaff.st")
	public String logoutStaff(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "default/staff/login";
	}
	
	@RequestMapping(value = "/lookup.st")
	public String lookup(Model model) {
		model.addAttribute("patientList", service.get_patient_list());
		return "staff/lookup/lookup";
	}


}
