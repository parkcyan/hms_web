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
import Reception.vo.MedicalRecordVO;
import Reception.vo.PatientVO;
import Reception.vo.StaffVO;

@Service
public class ReceptionService {
	@Autowired
	private ReceptionDAO dao;

	public StaffVO staff_login(Map<String, String> map) {
		return dao.staff_login(map);
		}
	
	public List<StaffVO> getStaff() {
		return dao.get_staff_list();
	}
	
	
	public List<PatientVO>getPatientList(){
		return dao.get_patient_list();
	}
	
	public PatientVO get_patient(String id) {
		return dao.get_patient(id);
	}
	
	public List<MedicalRecordVO>get_medical_record(String id){
		return dao.get_medical_record(id);
	}

	
	public void patient_insert(PatientVO vo) {
	   dao.patient_insert(vo);
	}

	public List<AcceptanceVO>getAcceptance(int id){
		
		return dao.get_acceptance(id);
		}
	
	public int acceptance_update(Map<String, String> map) {
		return dao.acceptance_update(map);
	}
	public  List<MedicalReceiptVO>get_medical_receipt(String doctor_id){
		return dao.get_medical_receipt(doctor_id);
	}
	public int receipt_insert(Map<String, Object> map){
		 return dao.receipt_insert(map);
	}
	public List<DepartmentVO>get_department(){
		return dao.get_department();
	}
	
	public List<DepartmentVO>get_doctor(int department_id){
		return dao.get_doctor(department_id);
	}
	
	public List<StaffVO>get_staff(){
		return dao.get_staff();
	}
	
	

	
	
}
