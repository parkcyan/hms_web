package app.customer.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class AdmissionRecordVO {
	private int admission_record_id, ward_id, medical_record_id, bed;
	private String admission_date, discharge_date, treatment_name, name, department_name, ward_number;
}
