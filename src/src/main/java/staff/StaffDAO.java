package staff;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import app.staff.vo.StaffVO;

@Repository
public class StaffDAO implements StaffService {
	
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	@Override
	public StaffVO login_staff(Map<String, String> map) {
		return sql.selectOne("staff.login_staff", map);
	}

}
