package staff.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class PatientVO {
	
    private int patient_id, height, weight;
    private String name, gender, phone_number, blood_type, allergy, underlying_disease, memo, social_id;

}
