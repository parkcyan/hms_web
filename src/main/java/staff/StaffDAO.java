 package staff;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import staff.vo.MedicalReceiptVO;
import staff.vo.AdmissionRecordVO;
import staff.vo.MedicalRecordVO;
import staff.vo.PatientVO;
import staff.vo.StaffVO;

@Repository
public class StaffDAO {
	
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	public StaffVO login_staff(Map<String, String> map) {
		return sql.selectOne("staff.login_staff", map);
	}
	
	public List<PatientVO> get_patient_list() {
		return sql.selectList("staff.get_patient_list");
	}
	
	public PatientVO get_patient(String id) {
		return sql.selectOne("staff.get_patient", id);
	}
	
	public int update_patient(PatientVO vo) {
		return sql.update("staff.update_patient", vo);
	}

	public int update_patient_memo(Map<String, String> map) {
		return sql.update("staff.update_patient_memo", map);
	}
	
	public List<MedicalRecordVO> get_medical_record_patient_id(String id) {
		return sql.selectList("staff.get_medical_record_patient_id", id);
	}
	
	public List<AdmissionRecordVO> get_admission_record_patient_id(String id) {
		return sql.selectList("staff.get_admission_record_patient_id", id);
	}
	
	public List<MedicalReceiptVO> get_medical_receipt(Map<String, String> map) {
		return sql.selectList("staff.get_medical_receipt", map);
	}

}
