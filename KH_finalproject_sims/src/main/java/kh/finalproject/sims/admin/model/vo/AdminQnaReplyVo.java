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
public class AdminQnaReplyVo {

	// 문의 게시판 대댓글
	private int rplNo; // 대댓글번호 PK
	private int aaNo; // 댓글번호 FK
	private Date rplDate; // 등록일
	private Date rplRedate; // 수정일
	private String rplContent; // 댓글내용
	private String adminId; // 관리자아이디
	private String userId; // 사용자아이디
	
	
}
