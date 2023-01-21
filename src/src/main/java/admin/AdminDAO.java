package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import app.staff.vo.PatientVO;

@Repository
public class AdminDAO implements AdminService{
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	//환자목록 조회
	@Override
	public List<PatientVO> patient_list() {
		return sql.selectList("admin.patient_list");
	}
	
	

}
