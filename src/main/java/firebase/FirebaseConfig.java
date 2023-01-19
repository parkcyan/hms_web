package firebase;

import java.io.FileInputStream;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.context.annotation.Configuration;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@Configuration
public class FirebaseConfig {

	String path = getClass().getResource("").getPath();

	@PostConstruct
	public void init() {
		try {
			FileInputStream serviceAccount = new FileInputStream(path + "serviceAccountKey.json");
			FirebaseApp firebaseApp = null;
			List<FirebaseApp> firebaseApps = FirebaseApp.getApps();
			if (firebaseApps != null && !firebaseApps.isEmpty()) {
				for (FirebaseApp app : firebaseApps) {
					if (app.getName().equals(FirebaseApp.DEFAULT_APP_NAME)) {
						firebaseApp = app;
					}
				}
			} else {
				FirebaseOptions options = new FirebaseOptions.Builder()
						.setCredentials(GoogleCredentials.fromStream(serviceAccount))
						.setDatabaseUrl("https://hmsmessenger-3a156-default-rtdb.asia-southeast1.firebasedatabase.app/")
						.build();
				firebaseApp = FirebaseApp.initializeApp(options);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
