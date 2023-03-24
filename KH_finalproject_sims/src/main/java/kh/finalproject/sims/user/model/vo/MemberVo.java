package kh.finalproject.sims.user.model.vo;

import org.springframework.stereotype.Component;

@Component
public class MemberVo {

	private String id;
	private String pw;
	private String role;
	private int enable;
	
	@Override
	public String toString() {
		return "UserMemberVo [id=" + id + ", pw=" + pw + ", role=" + role + ", enable=" + enable + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}
	
}
