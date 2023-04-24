package kh.finalproject.sims.biz.model.vo;

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
public class BizApplyVo {
//	--------------- -------- ------------ 
//	ORDER_NO        NOT NULL NUMBER       
//	USER_ID         NOT NULL VARCHAR2(30) 
//	PLAN_NO         NOT NULL NUMBER       
//	JOIN_CATEGORY   NOT NULL CHAR(1)      
//	SIM_TYPE        NOT NULL CHAR(1)      
//	SIM_YN          NOT NULL CHAR(1)      
//	CURRENT_TELECOM          CHAR(1)      
//	PLAN_BILL                CHAR(1)      
//	PLAN_PAY                 CHAR(1)      
//	CARD_NUMBER              VARCHAR2(20) 
//	CARD_EXPIRATION          VARCHAR2(10) 
//	BANK                     VARCHAR2(30) 
//	BANK_NUMBER              VARCHAR2(50) 
//	ORDER_DATE               DATE         
//	ORDER_STATUS             CHAR(1)      
//	NET_NO                   NUMBER       
//	GEN_NO                   NUMBER       
//	ORDER_PRICE              NUMBER       
//	ORDER_DATA               NUMBER       
//	ORDER_VOICE              NUMBER       
//	ORDER_MESSAGE            NUMBER       

	//plan_order
	private int orderNo;
	private String userId;
	private int planNo;
	private String joinCategory;
	private String simType;
	private String simYn;
	private String currentTelecom;
	private String planBill;
	private String planPay;
//	private String cardNumber;
//	private String cardExpiration;
//	private String bank;
//	private String bankNumber;
	private Date orderDate;
	private String orderStatus;
	private int NetNo;
	private int genN0;
	private int orderPrice;
	private int orderData;
	private int orderVoice;
	private int orderMessage;
	
//	payinfo_acc
//	---------------- -------- ------------ 
//	ORDER_NO         NOT NULL NUMBER       
//	ACC_HOLDER                VARCHAR2(20) 
//	ACC_SSN                   VARCHAR2(20) 
//	ACC_RELATIONSHIP          NUMBER       
//	ACC_NUMBER                VARCHAR2(50) 
//	ACC_BANK                  VARCHAR2(30) 
	private String accHolder;
	private String accSsn;
	private int accRelationship;
	private String accNumber;
	private String accBank;
	

//	payinfo_card
//	----------------- -------- ------------ 
//	ORDER_NO          NOT NULL NUMBER       
//	CARD_HOLDER                VARCHAR2(20) 
//	CARD_SSN                   VARCHAR2(20) 
//	CARD_RELATIONSHIP          NUMBER       
//	CARD_NUMBER                VARCHAR2(30) 
//	CARD_EXPIRATION            VARCHAR2(10) 
	private String cardHolder;
	private String cardSsn;
	private int cardRelationship;
	private String cardNumber;
	private String cardExpiration;
	
	
//	------------ -------- ------------- 
//	USER_ID      NOT NULL VARCHAR2(30)  
//	USER_NAME    NOT NULL VARCHAR2(20)  
//	USER_SSN     NOT NULL VARCHAR2(20)  
//	USER_WR_DATE NOT NULL DATE          
//	USER_UP_DATE          DATE          
//	USER_GENDER  NOT NULL CHAR(1)       
//	USER_PHONE            VARCHAR2(20)  
//	USER_EMAIL            VARCHAR2(30)  
//	USER_ADDRESS          VARCHAR2(100) 
	
	//user_table
	//private String userId;
	private String userName;
	private String userSsn;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	
	
//	----------------- -------- ------------- 
//	PLAN_NO           NOT NULL NUMBER        
//	PLAN_NAME         NOT NULL VARCHAR2(300) 
//	BIZ_NAME          NOT NULL VARCHAR2(30)  
//	NET_NO            NOT NULL NUMBER        
//	GEN_NO            NOT NULL NUMBER        
//	PLAN_PRICE                 NUMBER        
//	PLAN_VOICE                 NUMBER        
//	PLAN_MESSAGE               NUMBER        
//	PLAN_DATA                  NUMBER        
//	PLAN_VOICE_OVER            NUMBER(7,3)   
//	PLAN_MESSAGE_OVER          NUMBER        
//	PLAN_DATA_OVER             NUMBER(7,3)   
//	PLAN_DATE                  DATE 
	
	//desc plan_table;
	//private int planNo;
	private String planName;
	private String bizName;
	private int netNo;
	private int genNo;
	private int planPrice;
	private int planVoice;
	private int planMessage;
	private int planData;
	private double planVoiceOver;
	private double planMessageOver;
	private double planDataOver;
	private int planDate;
	
	//TODO biz 테이블도 추가
	private String bizId;
	//private String bizName;
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
	private String logoRenameFilename;
	
	private int rownum;
	private String serialNo;
	
	private int rn;
	private int searchCnt;
	
	private int listCnt;
}
