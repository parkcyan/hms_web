package staff.vo;

import java.sql.Timestamp;

import lombok.NoArgsConstructor;

public class ChatVO {
	
    private String id, name, content, time;

    public ChatVO() {

    }

    public ChatVO(String id, String name, String content) {
        this.id = id;
        this.name = name;
        this.content = content;
        time = new Timestamp(System.currentTimeMillis()).toString();
    }

    public ChatVO(String id, String name, String content, String time) {
        this.id = id;
        this.name = name;
        this.content = content;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getContent() {
        return content;
    }

    public String getTime() {
        return time;
    }

}
