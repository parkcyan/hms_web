 package staff;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import staff.vo.MedicalReceiptVO;
import staff.vo.AdmissionMemoVO;
import staff.vo.AdmissionRecordVO;
import staff.vo.MedicalRecordVO;
import staff.vo.PatientVO;
import staff.vo.PrescriptionVO;
import staff.vo.ScheduleVO;
import staff.vo.StaffVO;

@Repository
public class StaffDAO {
	
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	public StaffVO login_staff(Map<String, String> map) {
		return sql.selectOne("staff.login_staff", map);
	}
	
	public StaffVO get_staff(String id) {
		return sql.selectOne("staff.get_staff", id);
	}
	
	public int update_staff_introduction(Map<String, String> map) {
		return sql.update("staff.update_staff_introduction", map);
	}
	
	/**
	 * 환자조회
	 */
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
	
	public List<AdmissionRecordVO> get_admission_record_patient_id(String id) {
		return sql.selectList("staff.get_admission_record_patient_id", id);
	}
	
	public List<MedicalRecordVO> get_medical_record_patient_id(String id) {
		return sql.selectList("staff.get_medical_record_patient_id", id);
	}
	
	/**
	 * 진료
	 */
	public List<MedicalReceiptVO> get_medical_receipt(Map<String, String> map) {
		return sql.selectList("staff.get_medical_receipt", map);
	}
	
	public List<MedicalRecordVO> get_medical_record(Map<String, String> map) {
		return sql.selectList("staff.get_medical_record", map);
	}
	
	public PrescriptionVO get_prescription(String id) {
		return sql.selectOne("staff.get_prescription", id);
	}
	
	public String insert_medical_record(Map<String, String> map) {
		sql.insert("staff.insert_medical_record", map);
		return map.get("medical_record_id");
	}
	
	public int insert_prescription(Map<String, String> map) {
		return sql.insert("staff.insert_prescription", map);
	}
	
	public int delete_medical_receipt(Map<String, String> map) {
		return sql.delete("staff.delete_medical_receipt", map);
	}
	
	public int update_medical_record_memo(Map<String, String> map) {
		return sql.delete("staff.update_medical_record_memo", map);
	}
	
	/**
	 * 병동
	 */
	public List<AdmissionRecordVO> get_admission_record_ward(String ward_number) {
		return sql.selectList("staff.get_admission_record_ward", ward_number);
	}
	
	public List<AdmissionRecordVO> get_admission_record_search(Map<String, String> map) {
		return sql.selectList("staff.get_admission_record_search", map);
	}
	
	public int insert_admission_memo(Map<String, String> map) {
		return sql.insert("staff.insert_admission_memo", map);
	}

	public int delete_admission_memo(String id) {
		return sql.delete("staff.delete_admission_memo", id);
	}
	
	public List<AdmissionMemoVO> get_admission_memo(String id) {
		return sql.selectList("staff.get_admission_memo", id);
	}
	
	public int update_discharge_date(Map<String, String> map) {
		return sql.update("staff.update_discharge_date", map);
	}
	
	/**
	 * 일정
	 */
	public List<ScheduleVO> get_schedule_list(Map<String, String> map) {
		return sql.selectList("staff.get_schedule_list", map);
	}
	
	public int delete_schedule(Map<String, String> map) {
		return sql.delete("staff.delete_schedule", map);
	}
	
	public int insert_schedule(Map<String, String> map) {
		return sql.insert("staff.insert_schedule", map);
	}
	
	public int update_schedule(Map<String, String> map) {
		return sql.update("staff.update_schedule", map);
	}
	
	/**
	 * 채팅
	 */
	public List<StaffVO> get_staff_list() {
		return sql.selectList("staff.get_staff_list");
	}
	

}
