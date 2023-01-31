package Reception.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MedicalRecordVO {

	int medical_record_id, staff_id, patient_id;
	String treatment_date, admission, memo,treatment_name, staff_name, patient_name, gender, social_id, phone_number;

}
