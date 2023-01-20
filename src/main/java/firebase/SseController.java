package firebase;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
public class SseController {

	@Resource
	private HmsFirebase fb;

	@GetMapping(value = "/getNotCheckedChatCount.st")
	public SseEmitter getNotCheckedChatCount(String id) {
		SseEmitter emitter = new SseEmitter();
		fb.getNotCheckedChatCount(id, emitter);
		return emitter;
	}

	@GetMapping(value = "/getNotification.st")
	public SseEmitter getNotification(String id) {
		SseEmitter emitter = new SseEmitter();
		fb.getNotification(id, emitter);
		return emitter;
	}
	
	@GetMapping(value = "/getChatRoom.st")
	public SseEmitter getChatRoom(String id) {
		SseEmitter emitter = new SseEmitter();
		fb.getChatRoom(id, emitter);
		return emitter;
	}

}
