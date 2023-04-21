package kh.finalproject.sims.biz.model.vo;

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
public class BizInfoMngtVo {
//  desc biz;
//	-------------------- -------- ------------- 
//	BIZ_ID               NOT NULL VARCHAR2(30)  
//	BIZ_NAME                      VARCHAR2(30)  
//	BIZ_SSN                       VARCHAR2(30)  
//	BIZ_CRN                       VARCHAR2(20)  
//	BIZ_EMAIL                     VARCHAR2(50)  
//	BIZ_PHONE                     VARCHAR2(20)  
//	BIZ_FAX                       VARCHAR2(20)  
//	BIZ_OWNER_NAME                VARCHAR2(10)  
//	BIZ_HP                        VARCHAR2(100) 
//	BIZ_ZIP_CODE                  NUMBER 
//	BIZ_LOCATION                  VARCHAR2(200) 
//	BIZ_CARD_PAY_DATE             VARCHAR2(20)  
//	BIZ_ACC_PAY_DATE              VARCHAR2(20)  
//	BIZ_BEGIN_TIME                VARCHAR2(20)  
//	BIZ_END_TIME                  VARCHAR2(20)  
//	BIZ_CLOSED_DAY                VARCHAR2(20)  
//	BIZ_REVIEW_STAR               NUMBER        
//	PHONE_OP_TIME                 VARCHAR2(20)  
//	PHONE_OP_TIME_USIM            VARCHAR2(20)  
//	NETWORK                       VARCHAR2(20)  
//	WRITE_DATE           NOT NULL DATE          
//	UPDATE_DATE                   DATE          
//	LOGO_RENAME_FILENAME          VARCHAR2(100) 
//  ORIGINAL_FILENAME

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
	private double bizReviewStar;
	private String phoneOpTime;
	private String phoneOpTimeUsim;
	private String network;
	private Date writeDate;
	private Date updateDate;
	private String logoRenameFilename;
	private String originalFilename;
	
	private List<bizInfoMngServiceVo> serviceList;

	// 통신사 리뷰 갯수
	private int bizReviewCnt;
	
}
