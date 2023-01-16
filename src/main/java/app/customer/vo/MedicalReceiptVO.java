package app.customer.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class MedicalReceiptVO {
	private int patient_id, staff_id, receipt_id;
	private String time, memo, name, email, introduction, department_name, location;

}
