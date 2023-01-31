package app;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import app.reception.AppReceptionServiceImpl;
import app.reception.vo.MedicalReceiptVO;
import app.staff.vo.PatientVO;


@RestController
public class AppReceptionController {
	@Autowired private AppReceptionServiceImpl service;
	
	//예약정보조회하기
	@RequestMapping(value ="/appointment.re", produces ="text/html;charset=utf-8")
	public String search_appointment(String time) {
		List<MedicalReceiptVO> list = service.search_appointment(time);
		return new Gson().toJson(list);
	}
		
	//환자한명정보조회하기
		@RequestMapping(value ="/patient.re", produces ="text/html;charset=utf-8")
		public PatientVO search_patient(String name) {
			PatientVO vo = service.search_patient(name);
			System.out.println(vo);
			return vo;
		}

//	//로그인 하기	
//		@RequestMapping(value ="/login.re", produces ="text/html;charset=utf-8")
//		public String login(String id, String pw) {
//				HashMap<String, String> map = new HashMap<>();
//				map.put("id", id);
//				map.put("pw", pw);
//			return new Gson().toJson(service.login_staff(map));
//		}





}