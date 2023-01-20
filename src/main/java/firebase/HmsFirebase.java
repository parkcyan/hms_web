package firebase;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

@Service
public class HmsFirebase {

	private final String path = getClass().getResource("").getPath();
	private final FirebaseDatabase fbDb;
	private final DatabaseReference dbRef;

	private final DatabaseReference chatRoom;
	private final DatabaseReference member;
	private ValueEventListener notCheckedChatCountListener, getChatListener, getChatRoomListener,
			getNotificationListener;

	public HmsFirebase() {
		init();
		fbDb = FirebaseDatabase
				.getInstance("https://hmsmessenger-3a156-default-rtdb.asia-southeast1.firebasedatabase.app/");
		dbRef = fbDb.getReference();
		chatRoom = dbRef.child("chatRoom");
		member = dbRef.child("member");
	}
	
	private void init() {
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

	/**
     * 아직 읽지않은 채팅 수 불러오기
     */
    public void getNotCheckedChatCount(String id) {
        notCheckedChatCountListener = getNotCheckedChatCountListener();
        member.child(id).child("count")
                .addValueEventListener(getNotCheckedChatCountListener());
    }

    private ValueEventListener getNotCheckedChatCountListener() {
        return new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot snapshot) {
                int count = 0;
                for (DataSnapshot child : snapshot.getChildren()) {
                    count += child.getValue(Integer.class);
                }
                	
            }

            @Override
            public void onCancelled(DatabaseError error) {

            }
        };
    }

    public void removeNotCheckedChatCountListener(String id) {
        member.child(id).child("count").removeEventListener(notCheckedChatCountListener);
    }

}
