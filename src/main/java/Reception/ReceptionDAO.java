package Reception;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import Reception.vo.AcceptanceVO;
import Reception.vo.DepartmentVO;
import Reception.vo.MedicalReceiptVO;
import Reception.vo.MedicalRecordVO;
import Reception.vo.PatientVO;
import Reception.vo.StaffVO;
import staff.vo.AdmissionRecordVO;


@Repository
public class ReceptionDAO {
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	public StaffVO staff_login(Map<String, String> map) {
		return sql.selectOne("reception.staff_login", map);
	}
	
	public List<StaffVO> get_staff_list() {
		return sql.selectList("reception.get_staff_list");
	}
	public List<PatientVO> get_patient_list() {
		return sql.selectList("reception.get_patient_list");
	}
	
	public PatientVO get_patient(String id) {
		return sql.selectOne("reception.get_patient", id);
	}
	
	public List<AdmissionRecordVO> get_admission_record_patient_id(String id) {
		return sql.selectList("reception.get_admission_record_patient_id", id);
	}
	
	public List<MedicalRecordVO> get_medical_record(String id) {
		return sql.selectList("reception.get_medical_record", id);
	}
	
	
	

	public List<AcceptanceVO> get_acceptance(int id){
		return sql.selectList("reception.get_acceptance",id);
	}
	public int acceptance_update(Map<String, String> map) {
		return sql.update("reception.acceptance_update", map);
		
	}

	public void patient_insert(PatientVO vo) {
		sql.insert("reception.patient_insert", vo);
		
	}
	public List<MedicalReceiptVO> get_medical_receipt(String doctor_id) {
		return sql.selectList("reception.get_medical_receipt",doctor_id);
	}
	
	public int receipt_insert(Map<String, Object> map) {
		return sql.insert("reception.receipt_insert", map);
		
	}
	
	public List<DepartmentVO>get_department(){
		return sql.selectList("reception.get_department");
	}
	
	public List<DepartmentVO>get_doctor(int department_id){
		return sql.selectList("reception.get_doctor", department_id);
	}
	public List<StaffVO> get_staff() {
		return sql.selectList("reception.get_staff");
	}
	
	

	
	
}
