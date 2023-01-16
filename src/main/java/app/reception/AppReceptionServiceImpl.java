package app.reception;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import app.reception.vo.MedicalReceiptVO;
import app.staff.vo.PatientVO;
import app.staff.vo.StaffVO;

@Service
public class AppReceptionServiceImpl implements AppReceptionService {
	
	@Autowired
	private AppReceptionDAO dao;

	@Override
	public StaffVO login_staff(Map<String, String> map) {
		return dao.login_staff(map);
	}

	@Override
	public PatientVO search_patient(String name) {
			return dao.search_patient(name);
	}

	@Override
	public List<MedicalReceiptVO> search_appointment(String time) {		
		return dao.search_appointment(time);
	}

}
