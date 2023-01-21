package staff.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter @NoArgsConstructor
public class AdmissionRecordVO {
	
	int ward_id, admission_record_id, patient_id, staff_id;
	String patient_name, staff_name, treatment_name, department_name, admission_date, discharge_date;

}
