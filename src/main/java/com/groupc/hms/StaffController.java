package com.groupc.hms;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import staff.StaffService;
import staff.vo.MedicalReceiptVO;
import staff.vo.MedicalRecordVO;
import staff.vo.PatientVO;
import staff.vo.StaffChatVO;
import staff.vo.StaffVO;

@Controller
public class StaffController {
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	@Autowired private StaffService service;
	
	private StaffVO getStaff(HttpSession session) {
		return ((StaffVO) session.getAttribute("loginInfo"));
	}

	@RequestMapping(value = "/login.st")
	public String login() {
		return "default/staff/login";
	}
	
	@ResponseBody @RequestMapping(value = "/loginStaff.st")
	public boolean loginStaff(HttpSession session, String id, String pw) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		StaffVO vo = service.loginStaff(map);
		if (vo != null) {
			List<StaffVO> list = service.getStaff();
			LinkedHashMap<Integer, StaffChatVO> staffMap = new LinkedHashMap<>();
			for (StaffVO staff : list) {
				if (vo.getStaff_id() != staff.getStaff_id()) staffMap.put(staff.getStaff_id(), new StaffChatVO(staff));
			}
			session.setAttribute("loginInfo", vo);
			session.setAttribute("staffMap", staffMap);
			return true;
		} else return false;
	}
	
	@RequestMapping(value = "/logoutStaff.st")
	public String logoutStaff(HttpSession session) {
		session.removeAttribute("loginInfo");
		session.setAttribute("title", "로그인");
		return "default/staff/login";
	}
	
	/**
	 * 마이페이지
	 */
	@RequestMapping(value = "/mypage.st")
	public String mypage(HttpSession session) {
		session.setAttribute("title", "마이페이지");
		return "staff/mypage";
	}
	
	@ResponseBody @RequestMapping(value = "/updateStaffIntroduction.st")
	public boolean updateStaffIntroduction(HttpSession session, String introduction) {
		StaffVO vo = service.updateStaffIntroduction(getStaff(session), introduction);
		if (vo != null) {
			session.setAttribute("loginInfo", vo);
			return true;
		} else return false;	
	}
	
	/**
	 * 환자 조회
	 */
	@RequestMapping(value = "/lookup.st")
	public String lookup(HttpSession session, Model model) {
		model.addAttribute("patientList", service.getPatientList());
		session.setAttribute("title", "환자 조회");
		return "staff/lookup/lookup";
	}
	
	@RequestMapping(value = "/patientInfo.st")
	public String patientInfo(String id, Model model) {
		Map<String, Object> map = service.getPatient(id);
		if (map == null) return "staff/404";
		else {
			for (String key : map.keySet()) {
				model.addAttribute(key, map.get(key));
			}
			return "staff/lookup/patientinfo";
		}
	}

	@ResponseBody @RequestMapping(value = "/patientInfoAjax.st")
	public String lookupAjax(String id) {
		return new Gson().toJson(service.getPatientAjax(id));
	}
	
	@ResponseBody @RequestMapping(value = "/updatePatient.st")
	public boolean updatePatient(PatientVO vo) {
		return service.updatePatient(vo);
	}
	
	@ResponseBody @RequestMapping(value = "/updatePatientMemo.st")
	public boolean updatePatientMemo(String id, String memo) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("memo", memo);
		return service.updatePatientMemo(map);
	}
	
	/**
	 * 진료
	 */
	@RequestMapping(value = "/outpatient.st")
	public String outpatient() {
		return "staff/outpatient/outpatient";
	}
	
	@RequestMapping(value = "/outpatientRecord.st")
	public String outpatientRecord() {
		return "staff/outpatient/outpatientrecord";
	}
	
	@ResponseBody @RequestMapping(value = "/getMedicalReceipt.st")
	public String getMedicalReceipt(HttpSession session) {
		return new Gson().toJson(service.getMedicalReceipt(getStaff(session)));
	}
	
	@ResponseBody @RequestMapping(value = "/getMedicalRecord.st")
	public String getMedicalRecord(HttpSession session, String first_date, String second_date, String patient_name, String option) {
		return new Gson().toJson(service.getMedicalRecord(getStaff(session), first_date, second_date, patient_name, option));
	}
	
	@ResponseBody @RequestMapping(value = "/getOldMedicalRecord.st")
	public String getMedicalRecord(String id) {
		return new Gson().toJson(service.getMedicalRecord(id));
	}
	
	@ResponseBody @RequestMapping(value = "/getPrescription.st")
	public String getPrescription(String id) {
		return new Gson().toJson(service.getPrescription(id));
	}
	
	@ResponseBody @RequestMapping(value = "/insertMedicalRecord.st")
	public boolean insertMedicalRecord(HttpSession session, String patient_id, String treatment_name, String prescription_name, String admission, String memo) {
		return service.insertMedicalRecord(getStaff(session), patient_id, treatment_name, prescription_name, admission, memo);
	}
	
	@ResponseBody @RequestMapping(value = "/deleteMedicalReceipt.st")
	public boolean insertMedicalRecord(String patient_id, String time) {
		return service.deleteMedicalReceipt(patient_id, time);
	}
	
	@ResponseBody @RequestMapping(value = "/updateMedicalRecordMemo.st")
	public boolean updateMedicalRecordMemo(String memo, String id) {
		return service.updateMedicalRecordMemo(memo, id);
	}
	
	/**
	 * 병동
	 */
	@RequestMapping(value = "/ward.st")
	public String ward(HttpSession session, Model model) {
		session.setAttribute("title", "병동");
		return "staff/ward/ward";
	}
	
	@ResponseBody @RequestMapping(value = "/getAdmissionRecordWard.st")
	public String getAdmissionRecordWard(String ward_number) {
		return new Gson().toJson(service.getAdmissionRecordWard(ward_number));
	}
	
	@ResponseBody @RequestMapping(value = "/getAdmissionRecordSearch.st")
	public String getAdmissionRecordSearch(HttpSession session, String option, String patient_name) {
		return new Gson().toJson(service.getAdmissionRecordSearch(getStaff(session), option, patient_name));
	}
	
	@ResponseBody @RequestMapping(value = "/getAdmissionMemo.st")
	public String getAdmissionMemo(String id) {
		return new Gson().toJson(service.getAdmissionMemo(id));
	}
	
	@ResponseBody @RequestMapping(value = "/insertAdmissionMemo.st")
	public boolean insertAdmissionMemo(HttpSession session, String id, String memo) {
		return service.insertAdmissionMemo(getStaff(session), id, memo);
	}
	
	@ResponseBody @RequestMapping(value = "/deleteAdmissionMemo.st")
	public boolean deleteAdmissionMemo(String id) {
		return service.deleteAdmissionMemo(id);
	}
	
	@ResponseBody @RequestMapping(value = "/updateDischargeDate.st")
	public boolean updateDischargeDate(String date, String id) {
		return service.updateDischargeDate(date, id);
	}
	
	/**
	 * 일정
	 */
	@RequestMapping(value = "/schedule.st")
	public String schedule(HttpSession session, Model model) {
		session.setAttribute("title", "일정");
		return "staff/schedule/schedule";
	}
	
	@ResponseBody @RequestMapping(value = "/getSchedule.st")
	public String getSchedule(HttpSession session, String date) {
		return new Gson().toJson(service.getSchedule(getStaff(session), date));
	}
	
	@ResponseBody @RequestMapping(value = "/deleteSchedule.st")
	public boolean deleteSchedule(HttpSession session, String id) {
		return service.deleteSchedule(getStaff(session), id);
	}
	
	@ResponseBody @RequestMapping(value = "/updateSchedule.st")
	public boolean updateSchedule(HttpSession session, String id, String date, String content, String action) {
		return service.updateSchedule(getStaff(session), id, date, content, action);
	}

	/**
	 * 채팅
	 */
	@ResponseBody @RequestMapping(value = "/getStaff.st", produces = "text/html; charset=UTF-8")
	public String getStaff(Model model) {
		List<StaffVO> list = service.getStaff();
		model.addAttribute("staffList", list);
		return new Gson().toJson(service.getStaff());
	}

}
