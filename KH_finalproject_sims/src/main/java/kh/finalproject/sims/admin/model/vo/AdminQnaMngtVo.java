package kh.finalproject.sims.admin.model.vo;

import java.sql.Date;
import java.util.List;

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
public class AdminQnaMngtVo {


	// 문의 게시판
	private int aqNo; // 문의번호
	private String userId; // 사용자아이디
	private String aqTitle; // 문의제목
	private String aqContent; // 문의내용
	private Date aqDate; // 등록일
	private Date aqRedate; // 수정일
	private int aqViews; // 조회수
	private int aqAnswers; // 답변수
	private List<AdminQnaAnsVo> ansList; // 여러 댓글이 들어간다.
	
	// 조회용 변수
	private String searchOption;	// 조회 조건 
	private String searchBox;		// 조회 문구
		
}
