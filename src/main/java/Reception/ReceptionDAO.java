package Reception;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ReceptionDAO {
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
}
