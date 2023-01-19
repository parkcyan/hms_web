package Reception;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import Reception.vo.AcceptanceVO;
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
	
	public List<AcceptanceVO> get_acceptance(String id){
		return sql.selectList("reception.get_acceptance", id);
	}
	
	public List<PatientVO> get_patient_list() {
		return sql.selectList("reception.get_patient_list");
	}
	public PatientVO get_patient_info(String name) {
		return sql.selectOne("reception.patient_info", name);
	}
}
