package admin;

import org.springframework.stereotype.Service;

import com.google.firebase.messaging.AndroidConfig;
import com.google.firebase.messaging.AndroidConfig.Priority;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;

@Service
public class FCMService {
	
	//메시지 보내기
	public void sendMessage(int requestID, String registrationToken) throws FirebaseMessagingException {
		Message message = Message.builder()
				.setAndroidConfig(AndroidConfig.builder()
						.setTtl(3600 * 1000)
						.setPriority(Priority.HIGH)
						.setRestrictedPackageName("")
						)
	}
	
	
}
