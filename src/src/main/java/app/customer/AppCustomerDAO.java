package app.customer;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import app.customer.vo.AccountVO;
import app.customer.vo.AdmissionRecordVO;
import app.customer.vo.CustomerVO;
import app.customer.vo.MedicalReceiptVO;
import app.customer.vo.MedicalRecordVO;
import app.customer.vo.ReceiptVO;
import app.customer.vo.StaffSearchVO;

@Repository
public class AppCustomerDAO implements AppCustomerService {
	
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	//일반 로그인
	@Override
	public CustomerVO login_customer(Map<String, String> map) {
		return sql.selectOne("customer.login", map);
	}
	
	//신원정보 확인
	@Override
	public CustomerVO check_customer(Map<String, String> map) {
		return sql.selectOne("customer.customer_check", map);
	}
	
	//이메일 중복확인
	@Override
	public AccountVO check_email(String email) {
		return sql.selectOne("customer.email_check", email);
	}
	
	//환자등록
	@Override
	public void insert_patient(Map<String, Object> map) {
		sql.insert("customer.patient_insert", map);
	}
	
	//세부정보 등록
	@Override
	public void update_additional(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	
	//회원가입
	@Override
	public void join_customer(Map<String, String> map) {
		sql.insert("customer.customer_join", map);
	}
	
	//고객정보 조회
	@Override
	public CustomerVO info_patient(int patient_id) {
		return sql.selectOne("customer.info", patient_id);
	}
	
	//예약정보 조회
	@Override
	public List<ReceiptVO> info_receipt(int department_id) {
		return sql.selectList("customer.receipt_info", department_id);
	}
	
	//진료이력 조회
	@Override
	public List<MedicalRecordVO> list_medical(int patient_id) {
		return sql.selectList("customer.medical_list", patient_id);
	}
	
	//입원이력 조회
	@Override
	public List<AdmissionRecordVO> list_admission(int patient_id) {
		return sql.selectList("customer.admission_list", patient_id);
	}
	
	//진료일정 조회
	@Override
	public List<MedicalReceiptVO> schedule_medical(int staff_id) {
		return sql.selectList("customer.medical_schedule", staff_id);
	}
	
	//진료예약 조회
	@Override
	public List<MedicalReceiptVO> list_Receipt(int patient_id) {
		return sql.selectList("customer.receipt_list", patient_id);
	}
	
	//입원일정 조회
	@Override
	public AdmissionRecordVO info_admission(int patient_id) {
		return sql.selectOne("customer.admission_info", patient_id);
	}
	
	//고객정보 수정
	@Override
	public void update_info(int patient_id) {
		sql.update("customer.info_update", patient_id);
	}
	
	//진료예약
	@Override
	public void insert_receipt(MedicalReceiptVO vo) {
		sql.insert("customer.insert_receipt", vo);
	}
	
	//예약취소
	@Override
	public void delete_receipt(MedicalReceiptVO vo) {
		sql.delete("customer.delete_receipt", vo);
	}
	
	//의료진으로 검색
	@Override
	public List<StaffSearchVO> search_by_name(String searchWord) {
		return sql.selectList("customer.search_by_name", searchWord);
	}
	
	//진료과로 검색
	@Override
	public List<StaffSearchVO> search_by_department(String searchWord) {
		return sql.selectList("customer.search_by_department", searchWord);
	}
	
	//모바일 번호표
	@Override
	public List<MedicalReceiptVO> list_numberticket(int today) {
		return sql.selectList("customer.list_number_ticket", today);
	}











	

}
