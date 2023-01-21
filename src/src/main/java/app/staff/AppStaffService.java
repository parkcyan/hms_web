package app.staff;

import java.util.List;
import java.util.Map;

import app.staff.vo.AdmissionMemoVO;
import app.staff.vo.AdmissionRecordVO;
import app.staff.vo.MedicalReceiptVO;
import app.staff.vo.MedicalRecordVO;
import app.staff.vo.PatientVO;
import app.staff.vo.PrescriptionVO;
import app.staff.vo.ScheduleVO;
import app.staff.vo.StaffVO;

public interface AppStaffService {
	
	public StaffVO login_staff(Map<String, String > map);
	public List<StaffVO> get_stafflist();
	public List<PatientVO> get_patient(String name);
	public PatientVO get_patient_from_id(String id);
	public int update_staff_introduction(Map<String, String> map);
	public int update_patient_memo(Map<String, String> map);
	public List<MedicalReceiptVO> get_medical_receiptlist(Map<String, String> map);
	public List<MedicalRecordVO> get_medical_recordlist(Map<String, String> map);
	public PrescriptionVO get_prescription(String id);
	public int update_medical_record_memo(Map<String, String> map);
	public List<AdmissionRecordVO> get_admission_record_ward(String ward_number);
	public List<AdmissionRecordVO> get_admission_record_mypatient(Map<String, String> map);
	public int update_discharge_date(Map<String, String> map);
	public List<AdmissionMemoVO> get_admission_memo(String id);
	public int insert_admission_memo(Map<String, String> map);
	public int delete_admission_memo(String id);
	public List<ScheduleVO> get_schedule(Map<String, String> map);
	public int insert_schedule(Map<String, String> map);
	public int delete_schedule(Map<String, String> map);
	public int update_schedule(Map<String, String> map);
	public int update_schedule_complete(Map<String, String> map);

}
