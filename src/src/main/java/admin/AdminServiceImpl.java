package admin;

import java.util.List;

import org.springframework.stereotype.Service;

import app.staff.vo.PatientVO;

@Service("ad")
public class AdminServiceImpl implements AdminService{
	private AdminDAO dao;
	
	public AdminServiceImpl(AdminDAO dao) {
		this.dao = dao;
	}
	
	//환자목록 조회
	@Override
	public List<PatientVO> patient_list() {
		return dao.patient_list();
	}
	
	

}
