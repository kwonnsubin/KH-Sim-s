package kh.finalproject.sims.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component	
public class AdminQnaReplyVo {

	// 문의 게시판 대댓글
	private int rplNo; // 대댓글번호 PK
	private int aaNo; // 댓글번호 FK
	private Date rplDate; // 등록일
	private Date rplRedate; // 수정일
	private String rplContent; // 댓글내용
	private String adminId; // 관리자아이디
	private String userId; // 사용자아이디
	
	public int getRplNo() {
		return rplNo;
	}
	public void setRplNo(int rplNo) {
		this.rplNo = rplNo;
	}
	public int getAaNo() {
		return aaNo;
	}
	public void setAaNo(int aaNo) {
		this.aaNo = aaNo;
	}
	public Date getRplDate() {
		return rplDate;
	}
	public void setRplDate(Date rplDate) {
		this.rplDate = rplDate;
	}
	public Date getRplRedate() {
		return rplRedate;
	}
	public void setRplRedate(Date rplRedate) {
		this.rplRedate = rplRedate;
	}
	public String getRplContent() {
		return rplContent;
	}
	public void setRplContent(String rplContent) {
		this.rplContent = rplContent;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "AdminQnaReplyVo [rplNo=" + rplNo + ", aaNo=" + aaNo + ", rplDate=" + rplDate + ", rplRedate="
				+ rplRedate + ", rplContent=" + rplContent + ", adminId=" + adminId + ", userId=" + userId + "]";
	}
	
	
	
	

	
}
