package app.customer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import app.customer.vo.AccountVO;
import app.customer.vo.AdmissionRecordVO;
import app.customer.vo.CustomerVO;
import app.customer.vo.MedicalReceiptVO;
import app.customer.vo.MedicalRecordVO;
import app.customer.vo.ReceiptVO;
import app.customer.vo.StaffSearchVO;

@Service
public class AppCustomerServiceImpl implements AppCustomerService {
	
	@Autowired private AppCustomerDAO dao;
	
	//일반 로그인
	@Override
	public CustomerVO login_customer(Map<String, String> map) {
		return dao.login_customer(map);
	}
	
	//신원정보 확인
	@Override
	public CustomerVO check_customer(Map<String, String> map) {
		return dao.check_customer(map);
	}
	
	//이메일 중복확인
	@Override
	public AccountVO check_email(String email) {
		return dao.check_email(email);
	}
	
	//환자등록
	@Override
	public void insert_patient(Map<String, Object> map) {
		dao.insert_patient(map);
	}
	
	//세부정보 등록
	@Override
	public void update_additional(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}
	
	//회원가입
	@Override
	public void join_customer(Map<String, String> map) {
		dao.join_customer(map);
	}
		
	
	//고객정보 조회
	@Override
	public CustomerVO info_patient(int patient_id) {
		return dao.info_patient(patient_id);
	}
	
	//예약정보 조회
	@Override
	public List<ReceiptVO> info_receipt(int department_id) {
		return dao.info_receipt(department_id);
	}

	//진료이력 조회
	@Override
	public List<MedicalRecordVO> list_medical(int patient_id) {
		return dao.list_medical(patient_id);
	}
	
	//입원이력 조회
	@Override
	public List<AdmissionRecordVO> list_admission(int patient_id) {
		return dao.list_admission(patient_id);
	}
	
	//진료예약 조회
	@Override
	public List<MedicalReceiptVO> list_Receipt(int patient_id) {
		return dao.list_Receipt(patient_id);
	}
	
	//입원일정 조회
	@Override
	public AdmissionRecordVO info_admission(int patient_id) {
		return dao.info_admission(patient_id);
	}
	
	//고객정보 수정
	@Override
	public void update_info(int patient_id) {
		dao.update_info(patient_id);
	}
	
	//진료일정 조회
	@Override
	public List<MedicalReceiptVO> schedule_medical(int staff_id) {
		return dao.schedule_medical(staff_id);
	}
	
	//진료예약
	@Override
	public void insert_receipt(MedicalReceiptVO vo) {
		dao.insert_receipt(vo);
	}
	
	//예약취소
	@Override
	public void delete_receipt(MedicalReceiptVO vo) {
		dao.delete_receipt(vo);
		
	}
	
	//의료진으로 검색
	@Override
	public List<StaffSearchVO> search_by_name(String searchWord) {
		return dao.search_by_name(searchWord);
	}
	
	//진료과로 검색
	@Override
	public List<StaffSearchVO> search_by_department(String searchWord) {
		return dao.search_by_department(searchWord);
	}
	
	//모바일 번호표
	@Override
	public List<MedicalReceiptVO> list_numberticket(int today) {
		return dao.list_numberticket(today);
	}













}
