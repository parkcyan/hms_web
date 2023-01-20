package firebase;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.ValueEventListener;

@RestController
public class SseController {

	@GetMapping("/getMessage.st")
	public SseEmitter subscribe(String id) {
		SseEmitter emitter = new SseEmitter();
		new HmsFirebase().getNotCheckedChatCount(id, new ValueEventListener() {
			@Override
			public void onDataChange(DataSnapshot snapshot) {
				try {
					int count = 0;
					for (DataSnapshot child : snapshot.getChildren()) {
						count += child.getValue(Integer.class);
					}
					emitter.send(String.valueOf(count), MediaType.APPLICATION_JSON);
					emitter.complete();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
			@Override
			public void onCancelled(DatabaseError error) {

			}
		});
		return emitter;
	}

}
