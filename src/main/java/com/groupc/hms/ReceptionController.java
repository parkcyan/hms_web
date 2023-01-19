package com.groupc.hms;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Reception.ReceptionService;
import Reception.vo.AcceptanceVO;
import Reception.vo.StaffVO;



@Controller
public class ReceptionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReceptionController.class);
	
	@Autowired
	private ReceptionService service;
	
	//로그인 하기
	@ResponseBody @RequestMapping(value = "/login.re")
	public boolean login(HttpSession session, String id, String pw) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		StaffVO vo = service.login(map);
		session.setAttribute("loginInfo", vo);
		return service.login(map) != null;
	}
	//접수 등록
	//접수 조회
	//예약 조회
	
	//신규 등록
	//고객 정보 업데이트
	
	//수납조회
	@RequestMapping(value = "/acceptance.re")
	public String acceptance(HttpSession session, Model model) {
		session.setAttribute("title", "수납");
		return "reception/acceptance/acceptance";
	}

}
