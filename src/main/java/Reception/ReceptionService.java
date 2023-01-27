package Reception;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import Reception.vo.AcceptanceVO;
import Reception.vo.DepartmentVO;
import Reception.vo.MedicalReceiptVO;
import Reception.vo.PatientVO;
import Reception.vo.StaffVO;

@Service
public class ReceptionService {
	@Autowired
	private ReceptionDAO dao;

	public StaffVO login(Map<String, String> map) {
		return dao.login(map);
		}
	
	
	public List<PatientVO>getPatientList(){
		return dao.get_patient_list();
	}
	

	public void patient_insert(PatientVO vo) {
	   dao.patient_insert(vo);
	}

	public List<AcceptanceVO>getAcceptance(String name){
		
		return dao.get_acceptance(name);
		}
	
	public int acceptance_update(Map<String, String> map) {
		return dao.acceptance_update(map);
	}
	public  List<MedicalReceiptVO>get_medical_receipt(String time){
		return dao.get_medical_receipt(time);
	}
	public void receipt_insert(MedicalReceiptVO vo){
		 dao.receipt_insert(vo);
	}
	public List<DepartmentVO>get_department(){
		return dao.get_department();
	}
	
	public List<DepartmentVO>get_doctor(int department_id){
		return dao.get_doctor(department_id);
	}
	
	

	
	
}
