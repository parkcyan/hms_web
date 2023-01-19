package Reception;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import Reception.vo.StaffVO;


@Repository
public class ReceptionDAO {
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	public StaffVO login(Map<String, String> map) {
		return sql.selectOne("reception.login", map);
	}
}
