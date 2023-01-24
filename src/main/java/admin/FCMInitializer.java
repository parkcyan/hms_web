package admin;

import java.io.FileInputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@Service
public class FCMInitializer {
	
	public void initialize() throws IOException {
		

		FileInputStream serviceAccount =
		  new FileInputStream("E:/hms_web/src/main/java/admin/firebase_service_key.json");
		
		FirebaseOptions options = new FirebaseOptions.Builder()
		  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
		  .setDatabaseUrl("https://hmsmessenger-3a156-default-rtdb.asia-southeast1.firebasedatabase.app")
		  .build();
		
		FirebaseApp.initializeApp(options);

	}
}
