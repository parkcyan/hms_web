package Reception.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MedicalReceiptVO implements Serializable {
 int patient_id, staff_id, receipt_id ;
 String time,reserve_today, reserve_time, current_time,current_date, reserve_time_count,now_count,
 		memo, patient_name,doctor_name,department_name, now , status;
}

