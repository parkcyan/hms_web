package Reception.vo;


import java.sql.Date;

import lombok.Getter;

import lombok.Setter;

@Getter @Setter
public class StaffVO  {

	
	private int staff_id, staff_level, department_id,pw;
    private String name, department_name, lastChatCheckTime, social_id, email, phone_number, gender, introduction;
    private Date hire_date;
    
}