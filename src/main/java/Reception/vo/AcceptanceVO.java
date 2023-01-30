package Reception.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class AcceptanceVO implements Serializable{
	int acceptance_record_id, medical_record_id,  medical_expenses,admission_fee,
		inspection_fee,  operation_fee, pay_amount, patient_id;
	String benefit, patient,doctor,acceptance_date, gender, phone_number, social_id, current_record ;
}
