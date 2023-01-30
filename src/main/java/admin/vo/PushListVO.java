package admin.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class PushListVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int patient_id, staff_id;
	private String time, device_id, name, phone_number;
}
