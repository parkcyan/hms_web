package staff;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import staff.vo.PatientVO;
import staff.vo.StaffVO;

@Service
public class StaffService {
	
	@Autowired
	private StaffDAO dao;

	public StaffVO login_staff(Map<String, String> map) {
		return dao.login_staff(map);
	}
	
	public List<PatientVO> get_patient_list() {
		return dao.get_patient_list();
	}

}
