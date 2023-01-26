package Reception.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PatientVO {
	
    private int patient_id, height, weight, count;
    private String name, gender, phone_number, blood_type, allergy, underlying_disease, memo, social_id
    , doctor_name, admission, time;

}
