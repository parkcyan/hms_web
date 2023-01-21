package app;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import app.reception.AppReceptionService;
import app.reception.AppReceptionServiceImpl;
import app.staff.vo.StaffVO;

@RestController
public class AppController {
	
	@RequestMapping(value = "/test.ap")
	public String appTest() {

		return "appTest";
	}
	


}
