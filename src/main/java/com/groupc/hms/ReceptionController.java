package com.groupc.hms;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Reception.ReceptionService;
import Reception.vo.AcceptanceVO;
import Reception.vo.PatientVO;
import Reception.vo.StaffVO;



@Controller
public class ReceptionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReceptionController.class);
	
	@Autowired
	private ReceptionService service;	

	//환자 리스트 가져오기 
	@RequestMapping(value ="/patient_list.re")
	public String patient_list(HttpSession session, Model model) {
		model.addAttribute("patientList",service.getPatientList());
		
		session.setAttribute("title", "환자 조회");
		
		 return "reception/patient/patient_list";
	}

	/*
	 * //환자 이름 받아오기_1
	 * 
	 * @RequestMapping(value="/patient_info") public String
	 * search_patient(HttpSession session, Model model) { String name =(String)
	 * session.getAttribute("name"); model.addAttribute("name",name);
	 * System.out.println(); return "reception/patient/info"; }
	 */
	//환자 이름 받아오기_2
		@RequestMapping(value="/patient_info.re")
		public String get_info(@RequestParam String name, Model model) {
			model.addAttribute("name",name);
			return "reception/patient/info";
		}

	//신규 등록 화면
		@RequestMapping(value="registration.re")
		public String registration() {
			return "reception/registration/registration";
		}	
		//신규 등록 저장	
		@RequestMapping("/insert.re")
		public String insert(PatientVO vo) {
			service.patient_insert(vo);
			return "redicrect:registration.re";
		}

	
	//수납조회
	@RequestMapping(value = "/acceptance.re")
	public String acceptance(HttpSession session, Model model) {
		session.setAttribute("title", "수납");
		return "reception/acceptance/acceptance";
	}

}
