
package com.groupc.hms;

import java.util.Date;
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
import Reception.vo.DepartmentVO;
import Reception.vo.MedicalReceiptVO;
import Reception.vo.MedicalRecordVO;
import Reception.vo.PatientVO;
import Reception.vo.StaffVO;



@Controller
public class ReceptionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReceptionController.class);
	
	@Autowired
	private ReceptionService service;	
		//응답페이지 요청
		@RequestMapping(value = "/login.re") 
		public String login() { 
		  return  "reception/login"; 
	 }
	 
	  	  
		
	  @ResponseBody @RequestMapping(value = "/staff_login.re")
	  public boolean staff_login(HttpSession session, String id, String pw) { 
		String staff_id= id;
		String staff_pw= pw;
		HashMap<String,String> map = new HashMap<>();
		  map.put("id", staff_id); 
		  map.put("pw", staff_pw); 
		  StaffVO vo = service.staff_login(map); 
		  session.setAttribute("loginInfo", vo); 
		  if(vo!= null) 
			  return true; 
		  return false; 
		  }
	  
		@RequestMapping(value = "/staff_logout.re")
		public String logoutStaff(HttpSession session) {
			session.removeAttribute("loginInfo");
			session.setAttribute("title", "로그인");
			return "reception/login";
		}
	 


	//환자 리스트 가져오기 
	@RequestMapping(value ="/patient_list.re")
	public String patient_list(HttpSession session, Model model) {
		model.addAttribute("patientList",service.getPatientList());		
		session.setAttribute("title", "환자 조회");		
		 return "reception/patient/patient_list";
	}
	
	/*
	 * @RequestMapping(value = "/patientInfo.st") public String patientInfo(String
	 * id, Model model) { Map<String, Object> map = service.getPatient(id); if (map
	 * == null) return "staff/404"; else { for (String key : map.keySet()) {
	 * model.addAttribute(key, map.get(key)); } return "staff/lookup/patientinfo"; }
	 * }
	 */
	
	//환자 상세정보 가져오기 
	@RequestMapping(value ="/patient_info.re")
	public String patient_info( Model model, String id) {	
	//model.addAttribute("id", service.get_patient(id));
	List<MedicalRecordVO> list =service.get_medical_record(id); 
	model.addAttribute("list"  ,list);
	model.addAttribute("patient_id"  ,id);
		
		 return "reception/patient/patient_info";
	}
	
	//접수-환자 리스트
	@RequestMapping(value ="/re_patient_list.re")
	public String re_patient_list(HttpSession session, Model model) {
		model.addAttribute("patientList",service.getPatientList());		
		session.setAttribute("title", "환자 조회");
		
		 return "reception/receipt/re_patient_list";
				 
	}
	
	//수납-환자 리스트
	@RequestMapping(value ="/accep_patient_list.re")
	public String acce_patient_list(HttpSession session, Model model) {
		model.addAttribute("patientList",service.getPatientList());		
		session.setAttribute("title", "환자 조회");
		
		 return "reception/acceptance/accep_patient_list";
	}

		//신규 등록 화면 연결
		@RequestMapping(value="registration.re")
		public String registration() {
			return "reception/registration/registration";
		}	
		//신규 등록 저장	
		@RequestMapping(value="/new_patient.re")
		public String new_patient(PatientVO vo) {
			vo.setSocial_id(vo.getSocial_id().substring(2).replaceAll("-", ""));
			service.patient_insert(vo);
			return "redirect:patient_list.re";
		}
	
		//수납 조회
		@RequestMapping(value = "/acceptance.re")
		public String get_acceptance(Integer id, Model model) {
			List<AcceptanceVO> list = service.getAcceptance(id);
			model.addAttribute("list"  ,list);
			model.addAttribute("patient_id"  ,id);
			if(list == null) {				
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
		 
		 //접수
		 @ResponseBody
		 @RequestMapping("/receipt_insert.re")
		 public boolean receipt_insert(String patient_id, Integer staff_id, String memo) {
			 System.out.println(patient_id);
			 System.out.println(staff_id);
			 Map<String, Object>map = new HashMap<String, Object>();
			 map.put("patient_id", patient_id);
			 map.put("staff_id", staff_id);
			 map.put( "time", new Date().getTime());
			 map.put("memo", memo);
			 return service.receipt_insert(map)==1 ? true : false;
		 }
			
		 //예약정보 가져오기
		@RequestMapping("/receipt.re")
		 public String get_receipt( Model model , String name, String id , String doctor_id)  {
			List<MedicalReceiptVO> list = service.get_medical_receipt(doctor_id);
			model.addAttribute("list", list);
			model.addAttribute("time", new Date().getTime());
			model.addAttribute("name", name);	
			model.addAttribute("patient_id", id);
			model.addAttribute("doctor_id", doctor_id);
		//	model.addAttribute("doctor", doctor);
			model.addAttribute("staff_list", service.get_staff());		
			
			//model.addAttribute("department_id", service.get_doctor(department_id));	
			if(list != null) {
				System.out.println(list.size());
			}
			 return "reception/receipt/receipt";
		 }
		
			
		//진료과 및 담당의 정보 가져오기
		@RequestMapping(value="/get_department.re")
		public String get_department(Model model) {
			List<DepartmentVO> list = service.get_department();
			model.addAttribute("list",list);
			System.out.println(list.size());
			return "reception/receipt/receipt";
		}
}
