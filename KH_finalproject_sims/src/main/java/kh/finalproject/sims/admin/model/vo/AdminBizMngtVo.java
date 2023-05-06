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
public class AdminBizMngtVo {
	
	//통신사 
	// BIZ_ID	 			NOT NULL	VARCHAR2(30)
	// BIZ_NAME	 			NULL		VARCHAR2(30)
	// BIZ_SSN	 			NULL		VARCHAR2(30)
	// BIZ_CRN	 			NULL		VARCHAR2(20)
	// BIZ_EMAIL 			NULL		VARCHAR2(50)
	// BIZ_PHONE 			NULL		VARCHAR2(20)
	// BIZ_FAX	 			NULL		VARCHAR2(120)
	// BIZ_OWNER_NAME		NULL		VARCHAR2(10)
	// BIZ_HP				NULL		VARCHAR2(100)
	// BIZ_ZIP_CODE			NULL		NUMBER
	// BIZ_LOCATION 		NULL		VARCHAR2(200)
	// BIZ_CARD_PAY_DATE	NULL		VARCHAR2(20)
	// BIZ_ACC_PAY_DATE	 	NULL		VARCHAR2(20)
	// BIZ_BEGIN_TIME		NULL		VARCHAR2(20)
	// BIZ_END_TIME			NULL		VARCHAR2(20)
	// BIZ_CLOSED_DAY 		NULL		VARCHAR2(20)
	// BIZ_REVIEW_STAR		NULL		NUMBER
	// PHONE_OP_TIME		NULL		VARCHAR2(20)
	// PHONE_OP_TIME_USIM	NULL 		VARCHAR2(20)
	// NETWORK				NULL		VARCHAR2(20)
	// WRITE_DATE 			NOT NULL 	DATE
	// UPDATE_DATE			NULL 		DATE
	// LOGO_RENAME_FILENAME	NULL 		VARCHAR2

	private String bizId;
	private String bizName;
	private String bizSsn;
	private String bizCrn;
	private String bizEmail;
	private String bizPhone;
	private String bizFax;
	private String bizOwnerName;
	private String bizHp;
	private int bizZipCode;
	private String bizLocation;
	private String bizCardPayDate;
	private String bizAccPayDate;
	private String bizBeginTime;
	private String bizEndTime;
	private String bizClosedDay;
	private int bizReviewStar;
	private String phoneOpTime;
	private String phoneOpTimeUsim;
	private String network;
	private Date writeDate;
	private Date updateDate;
	private String logoRenameFileName;
	private String originalFileName;

	
	
	// 통신망
	// NET_NO				NOT NULL 	VARCHAR2(30)
	// NET_NAME				NULL		VARCHAR2(90)
	
	private String netNo;
	private String netName;
	
	// 통신사 통신망(고객센터번호)
	// BIZ_NET_SERVICE		NULL		VARCHAR2(20)
	
	private String bizNetService;
	private String ktNetService;
	private String sktNetService;
	private String lgNetService;
	
	// 이동통신세대
	// GEN_NO				NOT NULL	NUMBER
	// GEN_NAME				NOT NULL	VARCHAR2(10)
	
	private int genNo;
	private String genName;
	
	// 요금제 가입 정보
	// ORDER_NO				NOT NULL	NUMBER
	// USER_ID				NOT NULL	VARCHAR2(30)
	// PLAN_NO				NOT NULL	NUMBER
	// JOIN_CATEGORY		NOT NULL	CAHR(1)
	// SIM_TYPE				NOT NULL	CHAR(1)
	// SIM_YN				NOT NULL 	CHAR(1)
	// CURRENT_TELECOM		NULL		CHAR(1)
	// PLAN_BILL			NULL		CHAR(1)
	// PLAN_PAY				NULL		CHAR(1)
	// CARD_NUMBER			NULL		VARCHAR2(20)
	// CARD_EXPIRATION		NULL		VARCHAR2(10)
	// BANK					NULL		VARCHAR2(30)
	// BANK_NUMBER			NULL		VARCHAR2(50)
	// ORDER_DATE			NULL		DATE
	// ORDER_STATUS			NULL		CHAR
	// ORDER_PRICE			NULL		NUMBER
	// ORDER_DATA			NULL		NUMBER
	// ORDER_VOICE			NULL		NUMBER
	// ORDER_MESSAGE		NULL		NUMBER
	// ORDER_ADDRESS		NULL        VARCHAR(500) 
	
	private int orderNo;
	private String userId;
	private int planNo;
	private char joinCategory;
	private char simType;
	private char simYn;
	private char currentTelecom;
	private char planBill;
	private char planPay;
	private Date orderDate;
	private char orderStatus;
	private int orderPrice;
	private int orderData;
	private int orderVoice;
	private int orderMessage;
	private String orderAddress;
	
	//카드납부정보
	//CARD_HOLDER        NOT NULL  VARCHAR2(20)
	//CARD_SSN		     NULL	   VARCHAR2(20)
	//CARD_RELATIONSHIP  NULL	   NUMBER
	//CARD_NUMBER        NULL      VARCHAR2(30)
	//CARD_EXPIRATION    NULL      VARCHAR2(10)
	
	private String cardHolder;
	private String cardSsn;
	private int cardRelationship;
	private String cardNumber;
	private String cardExpiration;
	
	//계좌납부정보
	//ACC_HOLDER       NULL	  VARCHAR2(20)
	//ACC_SSN          NULL   VARCHAR2(20)
	//ACC_RELATIONSHIP NULL   NUMBER
	//ACC_NUMBER       NULL   VARCHAR2(50)
	//ACC_BANK         NULL   VARCHAR2(30)
	
	private String accHolder;
	private String accSsn;
	private int accRelationship;
	private String accNumber;
	private String accBank;
	
	
	// 요금제
	
	// PLAN_NAME			NOT NULL	VARCHAR2(300)
	// PLAN_PRICE			NULL		NUMBER
	// PLAN_VOICE			NULL		NUMBER
	// PLAN_MESSAGE			NULL		NUMBER
	// PLAN_DATA			NULL		NUMBER
	// PLAN_VOICE_OVER		NULL		NUMBER(7,3)
	// PLAN_MESSAGE_OVER	NULL		NUMBER
	// PLAN_DATA_OVER		NULL		NUMBER(7,3)
	
	private String planName;
	private int planPrice;
	private int planVoice;
	private int planMessage;
	private int planData;
	private int planVoiceOver;
	private int planMessageOver;
	private int planDataOver;
	
	
	//모든 멤버
	// ID    NOT NULL VARCHAR2(30)
	// PW    NOT NULL VARCHAR2(80)
	// ROLE  NOT NULL VARCHAR2(20)
	// ENABLE	NOT NULL	NUMBER
	
	private String id;
	private String pw;
	private String role;
	private int enable;
	private String opinion;
	
	
	//조회용 변수
	private String searchOption; // 조회 조건
	private String searchBox; // 조회 문구
	private String searchRadioVal;	// 조회 라디오버튼 값
	
	// 페이징 처리용
	private int totalRowCount;	// 전체 갯수
	private int currentPage;
	private int lastPage;
	private int pageLimit;
	private int listLimit;
	
	
	//사용자
	// USER_NAME	NOT NULL		VARCHAR2(20)
	// USER_SSN		NOT NULL		VARCHAR2(20)
	// USER_WR_DATE	NOT NULL		DATE
	// USER_UP_DATE NULL			DATE
	// USER_GENDER	NOT NULL		CHAR(1)
	// USER_PHONE	NULL			VARCHAR2(20)
	// USER_EMAIL	NULL			VARCHAR2(30)
	
	private String userName;
	private String userSsn;
	private Date userWrDate;
	private Date userUpDate;
	private char userGender;
	private String userPhone;
	private String userEmail;
	private String netNoCheck;	// 통신망 배열
	private String netNoDeleteCheck;	// 통신망 배열
	
}	