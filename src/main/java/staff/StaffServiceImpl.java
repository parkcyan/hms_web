package staff;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import app.staff.vo.StaffVO;

@Service
public class StaffServiceImpl implements StaffService {
	
	@Autowired
	private StaffDAO dao;

	@Override
	public StaffVO login_staff(Map<String, String> map) {
		return dao.login_staff(map);
	}

}
