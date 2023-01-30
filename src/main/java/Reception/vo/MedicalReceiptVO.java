package Reception.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MedicalReceiptVO {
 int patient_id, staff_id, receipt_id ;
 String time, reserve_time, current_time,current_date,
 		memo, patient_name,doctor_name,department_name ;
}

