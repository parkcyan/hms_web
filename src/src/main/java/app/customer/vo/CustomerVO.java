package app.customer.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class CustomerVO {
	
    private int patient_id, social_id, height, weight;
    private String name, pw, gender, email, phone_number, join_date, salt, social, qr, blood_type, allergy, underlying_disease, memo;

}
