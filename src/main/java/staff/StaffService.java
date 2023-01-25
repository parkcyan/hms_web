package staff;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import staff.vo.AdmissionMemoVO;
import staff.vo.AdmissionRecordVO;
import staff.vo.MedicalReceiptVO;
import staff.vo.MedicalRecordVO;
import staff.vo.PatientVO;
import staff.vo.ScheduleVO;
import staff.vo.StaffVO;

@Service
public class StaffService {
	
	@Autowired
	private StaffDAO dao;

	public StaffVO loginStaff(Map<String, String> map) {
		return dao.login_staff(map);
	}
	
	public StaffVO updateStaffIntroduction(StaffVO vo, String introduction) {
		Map<String, String> map = new HashMap<>();
		map.put("id", String.valueOf(vo.getStaff_id()));
		map.put("introduction", introduction);
		if (dao.update_staff_introduction(map) == 1) {
			return dao.get_staff(String.valueOf(vo.getStaff_id()));
		} else return null;
	}
	
	public List<PatientVO> getPatientList() {
		return dao.get_patient_list();
	}

	public PatientVO getPatientAjax(String id) {
		return dao.get_patient(id);
	}
	
	public Map<String, Object> getPatient(String id) {
		Map<String, Object> map = new HashMap<>();
		PatientVO vo = dao.get_patient(id);
		if (vo == null) return null;
		else {
			map.put("patient", vo);
			map.put("medical_record", dao.get_medical_record_patient_id(id));
			map.put("admission_record", dao.get_admission_record_patient_id(id));
			return map;
		}
	}
	
	public boolean updatePatient(PatientVO vo) {
		return dao.update_patient(vo) == 1;
	}
	
	public boolean updatePatientMemo(Map<String, String> map) {
		return dao.update_patient_memo(map) == 1;
	}
	
	/**
	 * 진료
	 */
	public List<MedicalReceiptVO> getMedicalReceipt(StaffVO vo) {
		Map<String, String> map = new HashMap<>();
		map.put("id", String.valueOf(vo.getStaff_id()));
		map.put("time", "2023-01-05");
		map.put("option", "doctor");
		//map.put("date", getDate(new Timestamp(System.currentTimeMillis())));
		return dao.get_medical_receipt(map);
	}

	public List<MedicalRecordVO> getMedicalRecord(StaffVO vo, String first_date, String second_date, String patient_name, String option) {
		Map<String, String> map = new HashMap<>();
		map.put("id", String.valueOf(vo.getStaff_id()));
		map.put("first_date", first_date);
		map.put("second_date", second_date);
		map.put("patient_name", patient_name);
		map.put("option", option);
		return dao.get_medical_record(map);
	}
	
	/**
	 * 병동
	 */
	public List<AdmissionRecordVO> getAdmissionRecordWard(String ward_number) {
		return dao.get_admission_record_ward(ward_number);
	}
	
	public List<AdmissionRecordVO> getAdmissionRecordSearch(StaffVO vo, String option, String patient_name) {
		Map<String, String> map = new HashMap<>();
		map.put("id", String.valueOf(vo.getStaff_id()));
		map.put("option", option);
		map.put("patient_name", patient_name);
		return dao.get_admission_record_search(map);
	}
	
	public List<AdmissionMemoVO> getAdmissionMemo(String id) {
		return dao.get_admission_memo(id);
	}
	
	/**
	 * 일정
	 */
	public List<ScheduleVO> getSchedule(StaffVO vo, String date) {
		Map<String, String> map = new HashMap<>();
		map.put("id", String.valueOf(vo.getStaff_id()));
		map.put("staff_level", String.valueOf(vo.getStaff_level()));
		map.put("date", date);
		return dao.get_schedule_list(map);
	}
	
	/**
	 * 채팅
	 */
	public List<StaffVO> getStaff() {
		return dao.get_staff_list();
	}
	
    private String getDate(Timestamp time) {
        SimpleDateFormat year = new SimpleDateFormat("yyyy", Locale.KOREA);
        SimpleDateFormat month = new SimpleDateFormat("MM", Locale.KOREA);
        SimpleDateFormat day = new SimpleDateFormat("dd", Locale.KOREA);
        return year.format(time) + "-" + month.format(time) + "-" + day.format(time);
    }
    

}
