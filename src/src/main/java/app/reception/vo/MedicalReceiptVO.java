package app.reception.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MedicalReceiptVO {
	private int patient_id, staff_id;
	private Date time;
	private String memo;
	
}
