package com.groupc.hms;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.google.gson.Gson;

import Reception.ReceptionService;
import Reception.vo.AcceptanceVO;
import Reception.vo.MedicalReceiptVO;
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
	
	//환자 상세 정보
	/*
	 * @RequestMapping(value = "/patient_info.re") public String patient_info(String
	 * id, Model model) { Map<String, Object> map = service.getPatientInfo(id); if
	 * (map == null) return "staff/404"; else { for (String key : map.keySet()) {
	 * model.addAttribute(key, map.get(key)); } return
	 * "reception/patient/patient_info"; } }
	 */
	

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
		//진료기록 조회
		@RequestMapping(value="/medical_record.re")
		public String medical_record(){
		
			return "reception/patient/medical_record";
		}
		

		//신규 등록 화면 연결
		@RequestMapping(value="registration.re")
		public String registration() {
			return "reception/registration/registration";
		}	
		//신규 등록 저장	
		@RequestMapping(value="/new_patient.re")
		public String new_patient(PatientVO vo) {
			service.patient_insert(vo);
			return "redirect:patient_list.re";
		}
	
		//수납 조회
		@RequestMapping(value = "/acceptance.re")
		public String get_acceptance(String name, Model model) {
			List<AcceptanceVO> list = service.getAcceptance(name);
			model.addAttribute("list"  ,list);
			model.addAttribute("name"  ,name);
			if(list != null) {				
				System.out.println(list.size());
			}
			return "reception/acceptance/acceptance";
		}
			
		//수납 업데이트
		 @ResponseBody
		 @RequestMapping("/acceptance_update.re")
		 public boolean acceptance_update(String money, String id) {
			 System.out.println(money);
			 System.out.println(id);
			Map<String, String> map = new HashMap<String, String>();
			map.put("pay_amount", money);
			map.put("id", id);
			return service.acceptance_update(map) == 1;
		 }
		 
		 @ResponseBody
		 @RequestMapping("/test.re")
		 public String test(String money) {
			 System.out.println(money);
			return "1";
		 }
		
		//접수 조회
		@RequestMapping("/receipt.re")
		public String get_receipt() {
			return "reception/receipt/receipt";
		}
		 //예약정보 가져오기
		@RequestMapping("/receipt.re")
		 public String get_receipt(String time, Model model) {
			List<MedicalReceiptVO> list = service.get_medical_receipt(time);
			model.addAttribute("list", list);
			model.addAttribute("time", time);
			if(list != null) {
				System.out.println(list.size());
			}
			 return "reception/receipt/receipt";
		 }

		 
	
	

}
