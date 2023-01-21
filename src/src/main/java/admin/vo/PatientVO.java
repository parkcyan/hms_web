package admin.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class PatientVO {
	private int patient_id, height, weight, social_id;
	private String blood_type, underlying_disease, allergy, memo, name, gender, phone_number;	
}
