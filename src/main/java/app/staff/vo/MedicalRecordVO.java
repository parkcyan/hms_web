package app.staff.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter @NoArgsConstructor
public class MedicalRecordVO {
	
	int medical_record_id, prescription_record_id;
	String patient_name, staff_name, treatment_date, treatment_name, admission, memo;

}
