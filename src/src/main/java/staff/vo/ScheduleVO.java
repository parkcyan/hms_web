package staff.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter @NoArgsConstructor
public class ScheduleVO {
	
    private int schedule_id, staff_id;
    private String content, time, complete;

}
