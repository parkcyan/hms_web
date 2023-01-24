package app;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import app.customer.AppCustomerServiceImpl;
import app.customer.vo.MedicalReceiptVO;

@RestController
public class AppCustomerController {
	
	@Autowired private AppCustomerServiceImpl service;
	
	//일반 로그인
	@RequestMapping(value = "/customer_login.cu", produces = "text/html; charset=UTF-8")
	public String customerLogin(String email, String pw) {
		HashMap<String, String> loginMap = new HashMap<>();
		
		loginMap.put("email", email);
		loginMap.put("pw", pw);
		
		return new Gson().toJson(service.login_customer(loginMap));
	}
	
	//신원확인
	@RequestMapping(value = "/customer_check.cu", produces = "text/html; charset=UTF-8")
	public String SocialIdCheck(String name, String social_id) {
		HashMap<String, String> map = new HashMap<>();
		
		System.out.println("확인" + name + " " + social_id);
		
		map.put("name", name);
		map.put("social_id", social_id);
		
		return new Gson().toJson(service.check_customer(map));		
	}
	
	//이메일 중복확인
	@RequestMapping(value = "/email_check.cu", produces = "text/html; charset=UTF-8")
	public String emailCheck(String email) {
		
		return new Gson().toJson(service.check_email(email));
	}
	
	//환자등록
	@RequestMapping(value = "/patient_insert.cu", produces = "text/html; charset=UTF-8")
	public void patientInsert(int social_id, String name, String gender, String phone_number) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("social_id", social_id);
		map.put("name", name);
		map.put("gender", gender);
		map.put("phone_number", phone_number);
		
		service.insert_patient(map);
	}
	
	//회원가입
	@RequestMapping(value = "/customer_join.cu", produces = "text/html; charset=UTF-8")
	public void customerJoin(String email, String pw, String patient_id) {
		HashMap<String, String> map = new HashMap<>();
		
		map.put("email", email);
		map.put("pw", pw);
		map.put("patient_id", patient_id);
		
		service.join_customer(map);
	}
	

	//환자정보 조회
	@RequestMapping(value = "/customer_info.cu", produces = "text/html; charset=UTF-8")
	public String patientInfo(int patient_id) {
		
		return new Gson().toJson(service.info_patient(patient_id));
	}
	
	//예약정보 조회
	@RequestMapping(value = "/receipt_info.cu", produces = "text/html; charset=UTF-8")
	public String receipt_info(int department_id) {
		
		return new Gson().toJson(service.info_receipt(department_id));
	}
	
	//진료이력 조회
	@RequestMapping(value = "/medical_record.cu", produces = "text/html; charset=UTF-8")
	public String medicalRecordList(int patient_id) {
		
		return new Gson().toJson(service.list_medical(patient_id));
	}
	
	//입원이력 조회
	@RequestMapping(value = "/admission_record.cu", produces = "text/html; charset=UTF-8")
	public String admissionRecordList(int patient_id) {
		
		return new Gson().toJson(service.list_admission(patient_id));
	}
	
	//진료예약 조회
	@RequestMapping(value = "/receipt_record.cu", produces = "text/html; charset=UTF-8")
	public String medicalReceipt(int patient_id) {
		
		return new Gson().toJson(service.list_Receipt(patient_id));
	}
	
	//예약일정 조회
	@RequestMapping(value = "/medical_schedule.cu", produces = "text/html; charset=UTF-8")
	public String medicalSchedule(int staff_id) {
	//	int aa = sql.selectOne("test");
		//System.out.println(aa);s
		return new Gson().toJson(service.schedule_medical(staff_id));
	}
	
	//입원일정 조회
	@RequestMapping(value = "/admission_schedule.cu", produces = "text/html; charset=UTF-8")
	public String admissionSchedule(int patient_id) {
	
		return new Gson().toJson(service.info_admission(patient_id));
	}
	
	//의료진으로 검색
	@RequestMapping(value = "/staffsearch_by_name.cu", produces = "text/html; charset=UTF-8")
	public String staffSearchByName(String searchWord) {
		System.out.println("검색어 : " + searchWord);
		
		return new Gson().toJson(service.search_by_name(searchWord));
	}
	
	//진료과로 검색
	@RequestMapping(value = "/staffsearch_by_department.cu", produces = "text/html; charset=UTF-8")
	public String staffSearchByDepartment(String searchWord) {
		System.out.println("검색과 : " + searchWord);
		
		return new Gson().toJson(service.search_by_department(searchWord));
	}
	
	//모바일 번호표
	@RequestMapping(value = "/number_ticket.cu", produces = "text/html; charset=UTF-8")
	public String NumberTicket(int today) {
		
		return new Gson().toJson(service.list_numberticket(today));
	}
	
	//고객정보 수정
	@RequestMapping(value = "/info_update.cu", produces = "text/html; charset=UTF-8")
	public void CustomerInfoUdate(int patient_id) {
		
	}
	
	//진료예약
	@RequestMapping(value = "/insert_medical.cu", produces = "text/html; charset=UTF-8")
	public void MedicalInsert(int patient_id, int staff_id, String time, String memo) {
		System.out.println(patient_id + " " + staff_id + " " + time);
		MedicalReceiptVO vo = new MedicalReceiptVO();
//		vo.setPatient_id(patient_id);
//		vo.setStaff_id(staff_id);
//		vo.setTime(time);
//		vo.setMemo(memo);
		
		service.insert_receipt(vo);
		
	}
	
	//예약취소
	@RequestMapping(value = "/delete_medical.cu", produces = "text/html; charset=UTF-8")
	public void MedicalDelete(int staff_id, String time) {
		MedicalReceiptVO vo = new MedicalReceiptVO();
//		vo.setStaff_id(staff_id);
//		vo.setTime(time);
		
		service.delete_receipt(vo);
	}
	
	
	
	

}
