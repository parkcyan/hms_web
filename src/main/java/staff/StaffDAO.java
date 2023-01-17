package staff;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import staff.vo.PatientVO;
import staff.vo.StaffVO;

@Repository
public class StaffDAO {
	
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	public StaffVO login_staff(Map<String, String> map) {
		return sql.selectOne("staff.login_staff", map);
	}
	
	public List<PatientVO> get_patient_list() {
		return sql.selectList("staff.get_patient_list");
	}

}
