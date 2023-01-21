package firebase;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import staff.vo.ChatVO;

@RestController
public class SseController {

	@Resource
	private HmsFirebase fb;

	@GetMapping(value = "/getNotCheckedChatCount.st")
	public SseEmitter getNotCheckedChatCount(String id) {
		SseEmitter emitter = new SseEmitter(120000L);
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
	
	@GetMapping(value = "/getChat.st")
	public SseEmitter getChat(String id, String key) {
		SseEmitter emitter = new SseEmitter();
		fb.getChat(id, key, emitter);
		return emitter;
	}	
	
	@GetMapping(value = "/sendChat.st")
	public boolean sendChat(String key, String title, String id, String name, String content) {
		ChatVO vo = new ChatVO(id, name, content);
		fb.sendChat(key, title, vo);
		return true;
	}

}
