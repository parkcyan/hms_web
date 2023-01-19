package Reception;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import Reception.vo.AcceptanceVO;
import Reception.vo.StaffVO;

@Service
public class ReceptionService {
	@Autowired
	private ReceptionDAO dao;

	public StaffVO login(Map<String, String> map) {
		return dao.login(map);
		}
	
	public List<AcceptanceVO>getAcceptance(String id){
		
		return dao.get_acceptance(id);
	}
	}
