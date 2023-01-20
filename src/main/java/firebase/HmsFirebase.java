package firebase;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import staff.vo.ChatRoomVO;
import staff.vo.ChatVO;

@Service
public class HmsFirebase {

	private final String path = getClass().getResource("").getPath();
	private final FirebaseDatabase fbDb;
	private final DatabaseReference dbRef;

	private final DatabaseReference chatRoom;
	private final DatabaseReference member;

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
	
	private void sendEmitter(SseEmitter emitter, Object object) {
		try {
			emitter.send(object, MediaType.APPLICATION_JSON);
			emitter.complete();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void sendEmitter(SseEmitter emitter) {
		try {
			emitter.send("null", MediaType.APPLICATION_JSON);
			emitter.complete();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
     * 아직 읽지않은 채팅 수 불러오기
     */
    public void getNotCheckedChatCount(String id, SseEmitter emitter) {
        member.child(id).child("count").addListenerForSingleValueEvent(new ValueEventListener() {
        	@Override
			public void onDataChange(DataSnapshot snapshot) {
        		int count = 0;
				for (DataSnapshot child : snapshot.getChildren()) {
					count += child.getValue(Integer.class);
				}
				sendEmitter(emitter, String.valueOf(count));
			}
			@Override
			public void onCancelled(DatabaseError error) {

			}
		});
    }
    
    /**
     * 채팅 알림
     */
    public void getNotification(String id, SseEmitter emitter) {
        member.child(id).child("lastChat").addListenerForSingleValueEvent(new ValueEventListener() {
        	@Override
			public void onDataChange(DataSnapshot snapshot) {
				if (snapshot.exists()) {
					sendEmitter(emitter, snapshot.getValue(ChatVO.class));
                }
			}
			@Override
			public void onCancelled(DatabaseError error) {
				// TODO Auto-generated method stub
				
			}
		});
    }
    
    /**
     * 채팅방 목록 불러오기
     */
    public void getChatRoom(String id, SseEmitter emitter) {
         member.child(id).child("lastChat").addListenerForSingleValueEvent(new ValueEventListener() {		
        	 @Override
             public void onDataChange(DataSnapshot snapshot) {
                 member.child(id).child("count").addListenerForSingleValueEvent(new ValueEventListener() {
                     @Override
                     public void onDataChange(DataSnapshot snapshot) {
                         ArrayList<ChatRoomVO> chatRoomList = new ArrayList<>();
                         if (!snapshot.exists()) {
                             sendEmitter(emitter);
                         } else {
                             final int[] childrenCount = {1};
                             for (DataSnapshot count : snapshot.getChildren()) {
                                 chatRoom.child(count.getKey()).addListenerForSingleValueEvent(new ValueEventListener() {
                                     @Override
                                     public void onDataChange(DataSnapshot chatRoom) {
                                         // 채팅방이 개설만 되고 채팅이 하나도 없을 경우
                                         if (!chatRoom.child("lastChat").exists()) {
                                             chatRoomList.add(new ChatRoomVO(
                                                     chatRoom.getKey(),
                                                     chatRoom.child("chatRoomTitle").getValue(String.class),
                                                     "", "2000-01-01 00:00:00.000",
                                                     String.valueOf(count.getValue(Integer.class))
                                             ));
                                         } else {
                                             chatRoomList.add(new ChatRoomVO(
                                                     chatRoom.getKey(),
                                                     chatRoom.child("chatRoomTitle").getValue(String.class),
                                                     chatRoom.child("lastChat").child("content").getValue(String.class),
                                                     chatRoom.child("lastChat").child("time").getValue(String.class),
                                                     String.valueOf(count.getValue(Integer.class))
                                             ));
                                         }
                                         if (childrenCount[0]++ == snapshot.getChildrenCount()) {
                                        	 ArrayList<ChatRoomVO> sortedList = (ArrayList<ChatRoomVO>) chatRoomList.stream()
                                        			 .sorted(Comparator.comparing(ChatRoomVO::getLastChatTime).reversed())
                                                     .collect(Collectors.toList());
                                             sendEmitter(emitter, sortedList);
                                         }
                                     }

                                     @Override
                                     public void onCancelled(DatabaseError error) {

                                     }
                                 });
                             }
                         }
                     }

                     @Override
                     public void onCancelled(DatabaseError error) {

                     }
                 });
             }

             @Override
             public void onCancelled(DatabaseError error) {

             }
		});
    }

}
