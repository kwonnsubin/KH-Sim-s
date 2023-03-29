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
public class BizPlanMngtVo {
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
	
	private int planNo; 
	private String planName;
	private String bizName;
	private int netNo;
	private int genNo;
	private int planPrice;
	private int planVoice;
	private int planMessage;
	private int data;
	private int planVoiceOver;
	private int planMessageOver;
	private int planDataOver;
	private Date planDate;
	
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
	
	
	//rownum도 따로 추가?
	private int rownum;


	
	
}
