package app.customer.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
public class ReceiptVO {
    private int staff_id, department_id;
    private String name, social_id, email, phone_number, introduction, department_name;
}
