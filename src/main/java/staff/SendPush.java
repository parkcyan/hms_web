package staff;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@RestController
public class SendPush {

	public final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
	public final String FCM_KEY = "AAAA5wiiJi4:APA91bGg4wl8hKdQ_hoUEhIHd3-pU2-7sqqjoRmM2ZA77lL4qVE4Tpnz578Zuzvcnfw7V2wKOjdEJbFupyregXKnmo2sqFIHcUbt2sxkUa1AHbHSBozeT3yUnwTzRyLUIIElv0qTn_9z";

	@RequestMapping(value = "/sendPush.st")
	public boolean sendPushNotification(String token, String content, String name, String key, String title) {
		Response res = null;
		try {
			OkHttpClient client = new OkHttpClient();
			JSONObject json = new JSONObject();
			JSONObject dataJson = new JSONObject();
			dataJson.put("content", content);
			dataJson.put("name", name);
			dataJson.put("key", key);
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

