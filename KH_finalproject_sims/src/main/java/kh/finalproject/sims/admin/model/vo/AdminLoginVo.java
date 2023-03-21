package kh.finalproject.sims.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AdminLoginVo {
//	ADMIN_ID NOT NULL VARCHAR2(30) 
//	ADMIN_PW NOT NULL VARCHAR2(50)
	
	private String adminId;
	private String adminPw;
	
	@Override
	public String toString() {
		return "AdminLoginVo [adminId=" + adminId + ", adminPw=" + adminPw + "]";
	}
	
	public AdminLoginVo() {
		super();
	}

	public AdminLoginVo(String adminId, String adminPw) {
		super();
		this.adminId = adminId;
		this.adminPw = adminPw;
	}


	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	
}
