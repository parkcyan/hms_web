package admin;


import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.groupc.hms.StaffController;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@RestController
public class PushAdmin {

	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	@Autowired
	@Qualifier("cteam")
	private SqlSession sql;
	
	public final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
	public final String FCM_KEY = "AAAA5wiiJi4:APA91bGg4wl8hKdQ_hoUEhIHd3-pU2-7sqqjoRmM2ZA77lL4qVE4Tpnz578Zuzvcnfw7V2wKOjdEJbFupyregXKnmo2sqFIHcUbt2sxkUa1AHbHSBozeT3yUnwTzRyLUIIElv0qTn_9z";
	
	@RequestMapping(value = "/sendPush.ad")
	public boolean sendPushNotification(String token, String content, String title) {
		Response res = null;
		try {
			OkHttpClient client = new OkHttpClient();
			JSONObject json = new JSONObject();
			JSONObject dataJson = new JSONObject();
			dataJson.put("content", "오늘 " + content + "에 예약이 있습니다");
			dataJson.put("title", title);
			json.put("data", dataJson);
			json.put("to", token);
			RequestBody body = RequestBody.create(JSON, json.toString());
			Request request = new Request.Builder().header("Authorization", "key=" + FCM_KEY)
					.url("https://fcm.googleapis.com/fcm/send").post(body).build();
			res = client.newCall(request).execute();
		} catch (Exception e) {
			e.printStackTrace();	
			return false;
		} finally {
			if (res != null) res.close();
		}
		return true;
	}
}

