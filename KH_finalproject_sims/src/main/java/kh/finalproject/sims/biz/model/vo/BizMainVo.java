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
public class BizMainVo {
	//desc plan_table;
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
	
	//biz
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
	

	//plan_order
	private int orderNo;
	private String userId;
	//private int planNo;
	private String joinCategory;
	private String simType;
	private String simYn;
	private String currentTelecom;
	private String planBill;
	private String planPay;
	private String cardNumber;
	private String cardExpiration;
	private String bank;
	private String bankNumber;
	private Date orderDate;
	private String orderStatus;
	private int NetNo;
	private int genN0;
	private int orderPrice;
	private int orderData;
	private int orderVoice;
	private int orderMessage;
	
	private int orderCnt;
	private int planApplyCnt;
}
