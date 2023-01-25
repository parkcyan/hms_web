package Reception;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import Reception.vo.AcceptanceVO;
import Reception.vo.PatientVO;
import Reception.vo.StaffVO;

@Service
public class ReceptionService {
	@Autowired
	private ReceptionDAO dao;

	public StaffVO login(Map<String, String> map) {
		return dao.login(map);
		}
	
	public List<AcceptanceVO>getAcceptance(String name){
		
		return dao.get_acceptance(name);
		}
	
	public List<PatientVO>getPatientList(){
		return dao.get_patient_list();
	}
	
	public PatientVO patient_info(String name) {
		return dao.get_patient_info(name);
	}
	
	public void patient_insert(PatientVO vo) {
	   dao.patient_insert(vo);
	}

	
}
