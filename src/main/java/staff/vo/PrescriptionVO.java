package staff.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter @NoArgsConstructor
public class PrescriptionVO {
	
	int prescription_record_id, staff_id;
	String patient_name, social_id, staff_name, prescription_name, treatment_date;
	
}
