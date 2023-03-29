package kh.finalproject.sims.admin.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class AdminQnaAnsVo {
	
	
	// 문의 게시판 답변(댓글)
	private int aaNo; // 댓글번호 PK
	private int aqNo; // 글번호
	private String adminId; // 관리자아이디
	private String userId; // 사용자아이디
	private String aaContent; // 답변내용
	private Date aaDate; // 작성일
	private String aaRedate; // 수정일
	private List<AdminQnaReplyVo> replyList; // 여러 대댓글이 들어간다.
	

	public AdminQnaAnsVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public AdminQnaAnsVo(int aaNo, int aqNo, String adminId, String userId, String aaContent, Date aaDate,
			String aaRedate, List<AdminQnaReplyVo> replyList) {
		super();
		this.aaNo = aaNo;
		this.aqNo = aqNo;
		this.adminId = adminId;
		this.userId = userId;
		this.aaContent = aaContent;
		this.aaDate = aaDate;
		this.aaRedate = aaRedate;
		this.replyList = replyList;
	}



	public int getAaNo() {
		return aaNo;
	}
	public void setAaNo(int aaNo) {
		this.aaNo = aaNo;
	}

	public int getAqNo() {
		return aqNo;
	}
	public void setAqNo(int aqNo) {
		this.aqNo = aqNo;
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
	public String getAaContent() {
		return aaContent;
	}
	public void setAaContent(String aaContent) {
		this.aaContent = aaContent;
	}
	public Date getAaDate() {
		return aaDate;
	}
	public void setAaDate(Date aaDate) {
		this.aaDate = aaDate;
	}
	public String getAaRedate() {
		return aaRedate;
	}
	public void setAaRedate(String aaRedate) {
		this.aaRedate = aaRedate;
	}
	public List<AdminQnaReplyVo> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<AdminQnaReplyVo> replyList) {
		this.replyList = replyList;
	}
	
	@Override
	public String toString() {
		return "AdminQnaAnsVo [aaNo=" + aaNo + ", aQvo=" + aqNo + ", adminId=" + adminId + ", userId=" + userId
				+ ", aaContent=" + aaContent + ", aaDate=" + aaDate + ", aaRedate=" + aaRedate + ", replyList="
				+ replyList + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
