package app.customer.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class AccountVO {
	
	private int patient_id;
	private String pw, email, salt, social, qr, date;
	
}
