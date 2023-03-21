package kh.finalproject.sims.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AdminQnaMngtVo {
//	FAQ_NO       NOT NULL NUMBER        
//	FAQ_TITLE    NOT NULL VARCHAR2(300) 
//	FAQ_CONTENT           CLOB          
//	ADMIN_ID     NOT NULL VARCHAR2(30)  
//	FAQ_REWRITER          VARCHAR2(30)  
	
	private String faqNo; // 질문번호
	private String faqTitle; // 질문제목
	private String faqContent; // 질문답변내용
	private String adminId; // 관리자아이디
	private String faqRewriter; // 수정자아이디
	
	@Override
	public String toString() {
		return "AdminQnaMngtVo [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", adminId="
				+ adminId + ", faqRewriter=" + faqRewriter + "]";
	}

	public AdminQnaMngtVo() {
		super();
	}

	public AdminQnaMngtVo(String faqNo, String faqTitle, String faqContent, String adminId, String faqRewriter) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.adminId = adminId;
		this.faqRewriter = faqRewriter;
	}

	public String getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(String faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getFaqRewriter() {
		return faqRewriter;
	}

	public void setFaqRewriter(String faqRewriter) {
		this.faqRewriter = faqRewriter;
	}
	

	
}
