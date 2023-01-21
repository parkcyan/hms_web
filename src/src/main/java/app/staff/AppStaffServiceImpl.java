package app.staff;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import app.staff.vo.MedicalReceiptVO;
import app.staff.vo.MedicalRecordVO;
import app.staff.vo.PatientVO;
import app.staff.vo.PrescriptionVO;
import app.staff.vo.ScheduleVO;
import app.staff.vo.StaffVO;
import app.staff.vo.AdmissionMemoVO;
import app.staff.vo.AdmissionRecordVO;

@Service
public class AppStaffServiceImpl implements AppStaffService {
	
	@Autowired private AppStaffDAO dao;

	@Override
	public List<PatientVO> get_patient(String name) {
		return dao.get_patient(name);
	}
	
	@Override
	public PatientVO get_patient_from_id(String id) {
		return dao.get_patient_from_id(id);
	}

	@Override
	public StaffVO login_staff(Map<String, String> map) {
		return dao.login_staff(map);
	}

	@Override
	public List<StaffVO> get_stafflist() {
		return dao.get_stafflist();
	}
	
	@Override
	public int update_staff_introduction(Map<String, String> map) {
		return dao.update_staff_introduction(map);
	}

	@Override
	public int update_patient_memo(Map<String, String> map) {
		return dao.update_patient_memo(map);
	}

	@Override
	public List<MedicalReceiptVO> get_medical_receiptlist(Map<String, String> map) {
		return dao.get_medical_receiptlist(map);
	}

	@Override
	public List<MedicalRecordVO> get_medical_recordlist(Map<String, String> map) {
		return dao.get_medical_recordlist(map);
	}

	@Override
	public PrescriptionVO get_prescription(String id) {
		return dao.get_prescription(id);
	}

	@Override
	public int update_medical_record_memo(Map<String, String> map) {
		return dao.update_medical_record_memo(map);
	}

	@Override
	public List<AdmissionRecordVO> get_admission_record_ward(String ward_number) {
		return dao.get_admission_record_ward(ward_number);
	}
	
	@Override
	public List<AdmissionRecordVO> get_admission_record_mypatient(Map<String, String> map) {
		return dao.get_admission_record_mypatient(map);
	}

	@Override
	public int update_discharge_date(Map<String, String> map) {
		return dao.update_discharge_date(map);
	}

	@Override
	public List<AdmissionMemoVO> get_admission_memo(String id) {
		return dao.get_admission_memo(id);
	}

	@Override
	public int insert_admission_memo(Map<String, String> map) {
		return dao.insert_admission_memo(map);
	}

	@Override
	public int delete_admission_memo(String id) {
		return dao.delete_admission_memo(id);
	}

	@Override
	public List<ScheduleVO> get_schedule(Map<String, String> map) {
		return dao.get_schedule(map);
	}

	@Override
	public int insert_schedule(Map<String, String> map) {
		return dao.insert_schedule(map);
	}

	@Override
	public int delete_schedule(Map<String, String> map) {
		return dao.delete_schedule(map);
	}

	@Override
	public int update_schedule(Map<String, String> map) {
		return dao.update_schedule(map);
	}

	@Override
	public int update_schedule_complete(Map<String, String> map) {
		return dao.update_schedule_complete(map);
	}


}
