package app.customer.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class MedicalRecordVO {
	private int medical_record_id, staff_id, patient_id, prescription_record_id, department_id;
	private String treatment_name, treatment_date, admission, memo, staff_name, department_name, prescription_name, patient_name;
	
}
