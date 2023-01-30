package com.groupc.hms;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.common.net.MediaType;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import admin.vo.PushListVO;
import staff.vo.StaffVO;



@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	
	//직원조회
	@RequestMapping(value = "/staffList.ad", method = RequestMethod.GET)
	public String staffList(Model model) {
		List<StaffVO> list = sql.selectList("admin.staff_list");
		model.addAttribute("list", list);
		
		return "admin/staff/list";
	}
	
	//직원정보
	@RequestMapping(value = "/staffInfo.ad", method = RequestMethod.GET)
	public String staffInfo(int staff_id, Model model) {
		StaffVO vo = sql.selectOne("admin.staff_info", staff_id);
		model.addAttribute("vo", vo);
		
		return "admin/staff/info";
	}
	
	//직원정보 수정
	
	//직원정보 삭제
	
	//신규사원등록
	@RequestMapping(value = "/staffInsert.ad", method = RequestMethod.GET)
	public String staffInsert(Model model) {
	
		return "admin/staff/new";
	}
	
	
	//푸시알림
	@RequestMapping(value = "/push.ad", method = RequestMethod.GET)
	public String pushList(Model model) {
		List<PushListVO> list = sql.selectList("admin.push_list");
		model.addAttribute("list", list);
		return "admin/push";
		
	}
	
	//QR접수
	@RequestMapping(value = "/selectqr.ad", method = RequestMethod.GET)
	public String selectQR(int department_id, Model model) {
		if (department_id > 0) {
			List<StaffVO> list = sql.selectList("staff_select", department_id);
			model.addAttribute("list", list);
		}else {
			
		}
		model.addAttribute("department_id", department_id);
		
		return "default/admin/qr/selectqr";
	}
	
	//QR생성
	@RequestMapping(value = "/qr.ad", method = RequestMethod.GET)
    public String goQr(String staff_id, Model model) throws Exception {
		StaffVO vo = sql.selectOne("staff_info", staff_id);
		String img = getQRCodeImage(staff_id, 600, 600);
		model.addAttribute("img", img);
		model.addAttribute("department_name", vo.getDepartment_name());
		model.addAttribute("name", vo.getName());
		
		return "default/admin/qr/qr";
    }
	
	// QR코드 이미지 생성
	public static String getQRCodeImage(String text, int width, int height) throws WriterException, IOException {
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

		ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();

		MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);

		return Base64.getEncoder().encodeToString(pngOutputStream.toByteArray());
	}
	
	
}
