package staff.vo;

import java.io.Serializable;

public class StaffChatVO implements Serializable {

    private int staff_id, staff_level, department_id;
    private String name, department_name, lastChatCheckTime;
    private boolean onChat;

    public StaffChatVO() {

    }

    public StaffChatVO(int staff_id, int staff_level, int department_id, String name, String department_name) {
        this.staff_id = staff_id;
        this.staff_level = staff_level;
        this.department_id = department_id;
        this.name = name;
        this.department_name = department_name;
        onChat = false;
        lastChatCheckTime = null;
    }
    
    public StaffChatVO(StaffVO vo) {
    	staff_id = vo.getStaff_id();
    	staff_level = vo.getStaff_level();
    	department_id = vo.getDepartment_id();
    	name = vo.getName();
    	department_name = vo.getDepartment_name();
    	onChat = false;
        lastChatCheckTime = null;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public int getStaff_level() {
        return staff_level;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public String getName() {
        return name;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public String getLastChatCheckTime() {
        return lastChatCheckTime;
    }

    public boolean isOnChat() {
        return onChat;
    }
    
}
