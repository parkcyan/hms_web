package com.groupc.hms;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.ValueEventListener;
import com.google.gson.Gson;

import staff.StaffService;
import staff.vo.MedicalReceiptVO;
import staff.vo.PatientVO;
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
		session.setAttribute("loginInfo", vo);
		return vo != null;
	}
	
	@RequestMapping(value = "/logoutStaff.st")
	public String logoutStaff(HttpSession session) {
		session.removeAttribute("loginInfo");
		session.setAttribute("title", "로그인");
		return "default/staff/login";
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
	 * 진료(외래)
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
	public String getMedicalReceipt(HttpSession session, Model model) {
		List<MedicalReceiptVO> list = service.getMedicalReceipt(getStaff(session));
		return new Gson().toJson(list);
	}
	
	/**
	 * 병동
	 */
	@RequestMapping(value = "/ward.st")
	public String ward(HttpSession session, Model model) {
		session.setAttribute("title", "병동");
		return "staff/ward/ward";
	}
	
	/**
	 * 일정
	 */
	@RequestMapping(value = "/schedule.st")
	public String schedule(HttpSession session, Model model) {
		session.setAttribute("title", "일정");
		return "staff/schedule/schedule";
	}

}
