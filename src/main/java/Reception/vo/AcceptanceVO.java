package Reception.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class AcceptanceVO {
	int acceptance_record_id, medical_record_id,  medical_expenses,admission_fee,
		inspection_fee,  operation_fee ;
	String benefit ;
}
