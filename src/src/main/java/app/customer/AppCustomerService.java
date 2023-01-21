package app.customer;

import java.util.List;
import java.util.Map;

import app.customer.vo.AccountVO;
import app.customer.vo.AdmissionRecordVO;
import app.customer.vo.CustomerVO;
import app.customer.vo.MedicalReceiptVO;
import app.customer.vo.MedicalRecordVO;
import app.customer.vo.ReceiptVO;
import app.customer.vo.StaffSearchVO;

public interface AppCustomerService {
	
	public CustomerVO login_customer(Map<String, String> map);		//일반 로그인
	public CustomerVO check_customer(Map<String, String> map);		//신원정보 확인
	public AccountVO check_email(String email);						//이메일 중복확인
	public void insert_patient(Map<String, Object> map);			//환자등록
	public void update_additional(Map<String, Object> map);			//세부정보 등록
	public void join_customer(Map<String, String> map);				//회원가입
	
	public CustomerVO info_patient(int patient_id);					//고객정보 조회
	public List<ReceiptVO> info_receipt(int department_id);			//예약정보 조회
	public List<MedicalRecordVO> list_medical(int patient_id);		//진료이력 조회
	public List<AdmissionRecordVO> list_admission(int patient_id);	//입원이력 조회
	public List<MedicalReceiptVO> list_Receipt(int patient_id);		//진료예약 조회
	public List<MedicalReceiptVO> schedule_medical(int staff_id);	//진료일정 조회
	public AdmissionRecordVO info_admission(int patient_id);		//입원일정 조회
	public void update_info(int patient_id);						//고객정보 수정
	
	public List<MedicalReceiptVO> list_numberticket(int today);		//모바일번호표 조회
	
	public List<StaffSearchVO> search_by_name (String searchWord);		//의료진으로 검색
	public List<StaffSearchVO> search_by_department (String searchWord);	//진료과로 검색
	
	
	public void insert_receipt(MedicalReceiptVO vo);				//진료예약
	public void delete_receipt(MedicalReceiptVO vo);				//예약취소
	
	
}
