package app.reception;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import app.reception.vo.MedicalReceiptVO;
import app.staff.vo.PatientVO;
import app.staff.vo.StaffVO;

@Repository
public class AppReceptionDAO implements AppReceptionService {
	
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;

	@Override
	public StaffVO login_staff(Map<String, String> map) {
		return sql.selectOne("re.login", map);
	}

	@Override
	public PatientVO search_patient(String name) {
		return sql.selectOne("re.patient", name);
	}

	@Override
	public List<MedicalReceiptVO> search_appointment(String time) {
		return sql.selectList("re.appointment", time);
	}

}
