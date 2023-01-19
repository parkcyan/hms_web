package staff.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter @NoArgsConstructor
public class MedicalReceiptVO {
	
	int patient_id;
	String patient_name, staff_name, time, memo;

}
