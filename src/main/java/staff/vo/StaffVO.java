package staff.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor
public class StaffVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int staff_id, staff_level, department_id;
    private String name, department_name, lastChatCheckTime, social_id, email, phone_number, gender, introduction;
    private Date hire_date;
    
}