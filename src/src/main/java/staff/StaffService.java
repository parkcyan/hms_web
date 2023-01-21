package staff;

import java.util.Map;

import app.staff.vo.StaffVO;

public interface StaffService {
	
	public StaffVO login_staff(Map<String, String> map);

}
