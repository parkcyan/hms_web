package admin;

import java.util.List;

import app.staff.vo.PatientVO;


public interface AdminService {

	List<PatientVO> patient_list();				//환자목록 조회

	
}
