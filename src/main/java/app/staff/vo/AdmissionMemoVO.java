package app.staff.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter @NoArgsConstructor
public class AdmissionMemoVO {
	
	int admission_memo_id, staff_id;
	String name, memo, write_date;

}
