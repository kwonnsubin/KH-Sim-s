package kh.finalproject.sims.admin.model.vo;

import java.util.Date;

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
public class AdminUserMngtVo {
	
	// USER_ID        NOT NULL  VARCHAR2(30)
	// USER_NAME	  NOT NULL  VARCHAR2(20)
	// USER_SSN		  NOT NULL  VARCHAR2(20)
	// USER_WR_DATE	  NOT NULL  DATE
	// USER_UP_DATE   NULL      DATE
	// USER_GENDER	  NOT NULL  CHAR(1)
	// USER_PHONE     NULL      VARCHAR2(30)
	// USER_EMAIL	  NULL      VARCHAR2(30)
	// USER_ADDRESS	  NULL      VARCHAR2(100)
	
	private String userId;
	private String userName;
	private String userSsn;
	private Date userWrdate;
	private Date userUpdate;
	private char userGender;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	private String birth;
	
	// 조회용 변수
	private String searchUserId;	// 아이디 조회
	private String searchUserName;	// 이름 조회
	private String searchRadioVal;	// 라디오 조회
	
	// 페이징 처리용
	private int totalRowCount;	// 전체 갯수
	private int currentPage;
	private int lastPage;
	private int pageLimit;
	private int listLimit;
	
	//모든멤버
	private int enable;
	private String opinion;
	
	private String planName;
	
	
	
}

