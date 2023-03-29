package kh.finalproject.sims.admin.model.vo;

import java.sql.Timestamp;

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
public class AdminNoticeMngtVo {
	
	
	//NTC_NO       NOT NULL    NUMBER
	//NTC_TITLE    NOT NULL    VARCHAR2(300)
	//NTC_CONTENT  NOT NULL    CLOB
	//NTC_REWRITER NULL        VARCHAR2(30)
	//NTC_DATE NOT NULL        TIMESTAMP
	//NTC_REDATE   NULL        TIMESTAMP
	//ADMIN_ID     NOT NULL    VARCHAR2(30)

	private int ntcNo;
	private String ntcTitle;
	private String ntcContent;
	private String ntcRewriter;
	private Timestamp ntcDate;
	private Timestamp ntcRedate;
	private String adminId;
	
	// 조회용 변수
	private String searchOption;	// 조회 조건 
	private String searchBox;		// 조회 문구


	
	
}
