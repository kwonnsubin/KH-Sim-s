package kh.finalproject.sims.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AdminFaqVo {
	
	// 자주묻는질문 게시판 분리!!!!
	private String faqNo; // 질문번호
	private String faqTitle; // 질문제목
	private String faqContent; // 질문답변내용
	private String adminId; // 관리자아이디
	private String faqRewriter; // 수정자아이디
	private Date faqDate; // 작성일
	private Date faqRedate; // 수정일
	private int n; // rowNumber
	
	// 조회용 변수
	//private String searchOption;	// 조회 조건 
	//private String searchBox;		// 조회 문구
	
}
