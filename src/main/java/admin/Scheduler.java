package admin;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.groupc.hms.StaffController;

import admin.vo.PushListVO;

@Component
public class Scheduler {
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	@Scheduled(cron = "0 01 12 * * *")
	public void sendPush() throws Exception{
		PushAdmin push = new PushAdmin();
		List<PushListVO> list = sql.selectList("admin.push_list");
		System.out.println("스케쥴러 작동");
		for (int i = 0; i < list.size(); i++) {
			push.sendPushNotification(list.get(i).getDevice_id(), list.get(i).getTime().substring(11, 16), "진료 예약 알림");
			System.out.println("환자ID" + list.get(i).getPatient_id() + " : 푸시알림 전송");
		}
	}	
}
