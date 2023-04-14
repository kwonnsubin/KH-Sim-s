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
public class AdminQnaAnsVo {
	
	// 문의 게시판 답변
	private int aaNo; // 댓글번호 PK
	private int aqNo; // 글번호
	private String adminId; // 관리자아이디
	private String userId; // 사용자아이디
	private String aaContent; // 답변내용
	private Date aaDate; // 작성일
	private String aaRedate; // 수정일
	private List<AdminQnaReplyVo> replyList; // 여러 대댓글이 들어간다.
		
}
