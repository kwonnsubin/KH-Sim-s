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
//  desc plan_table;
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
//  PLAN_DATE                  DATE 
	
	private int planNo; 
	private String planName;
	private String bizName;
	private int netNo;
	private int genNo;
	private int planPrice;
	private int planVoice;
	private int planMessage;
	private int planData;
	private double planVoiceOver;
	private int planMessageOver;
	private double planDataOver;
	private Date planDate;
	
	private Date planUpdateDate;
	
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
	
	private int listCnt;
	
	private int rn;

	//search
	private String keyword;
	
	//bizMyPage-mapper에서 사용
	private int planCnt;

	
	
}
