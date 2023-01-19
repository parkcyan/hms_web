package firebase;

import org.springframework.stereotype.Service;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

@Service
public class HmsFirebase {
	
	private static final String RB_URL = "https://hmsmessenger-3a156-default-rtdb.asia-southeast1.firebasedatabase.app/";
    private static final FirebaseDatabase fbDb = FirebaseDatabase.getInstance(RB_URL);
    private static final DatabaseReference dbRef = fbDb.getReference();
    
    private final DatabaseReference chatRoom;
    private final DatabaseReference member;
    
    public HmsFirebase() {
        chatRoom = dbRef.child("chatRoom");
        member = dbRef.child("member");
    }


}
