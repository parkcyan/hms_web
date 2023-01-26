package Reception;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import Reception.vo.AcceptanceVO;
import Reception.vo.MedicalReceiptVO;
import Reception.vo.MedicalRecordVO;
import Reception.vo.PatientVO;
import Reception.vo.StaffVO;


@Repository
public class ReceptionDAO {
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	public StaffVO login(Map<String, String> map) {
		return sql.selectOne("reception.login", map);
	}
	
	public List<PatientVO> get_patient_list() {
		return sql.selectList("reception.get_patient_list");
	}
	public PatientVO get_patient_info(String id) {
		return sql.selectOne("reception.patient_info", id);
	}
	
	public List<MedicalRecordVO> get_medical_record(Map<String, String> map) {
		return sql.selectList("staff.get_medical_record", map);
	}

	public List<AcceptanceVO> get_acceptance(String name){
		return sql.selectList("reception.get_acceptance", name);
	}

	public void patient_insert(PatientVO vo) {
		sql.insert("reception.patient_insert", vo);
		
	}
	public List<MedicalReceiptVO> get_medical_receipt(String time) {
		return sql.selectList("reception.get_medical_receipt", time);
	}
	public int acceptance_update(Map<String, String> map) {
		return sql.update("reception.acceptance_update", map);
		
	}
	
}
