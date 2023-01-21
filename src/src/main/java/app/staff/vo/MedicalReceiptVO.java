package app.staff.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter @NoArgsConstructor
public class MedicalReceiptVO {
	
	String patient_name, staff_name, time, memo;

}
