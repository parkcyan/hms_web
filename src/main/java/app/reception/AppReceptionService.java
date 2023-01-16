package app.reception;

import java.util.List;
import java.util.Map;

import app.reception.vo.MedicalReceiptVO;
import app.staff.vo.PatientVO;
import app.staff.vo.StaffVO;

public interface AppReceptionService {
	
	public StaffVO login_staff(Map<String, String> map);
	public PatientVO search_patient(String name);
	public List<MedicalReceiptVO> search_appointment(String time);

}
