package kh.finalproject.sims.biz.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
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
	
	//desc plan_table;
	//private int planNo;
	private String planName;
	private String bizName;
	private int planPrice;
	private int planVoice;
	private int planMessage;
	private int data;
	
	
	
	public BizApplyVo() {
	}
	
	public BizApplyVo(int orderNo, String userId, int planNo, String joinCategory, String simType, String simYn,
			String currentTelecom, String planBill, String planPay, String cardNumber, String cardExpiration,
			String bank, String bankNumber, Date orderDate, String orderStatus, int netNo, int genN0, int orderPrice,
			int orderData, int orderVoice, int orderMessage, String userName, String userSsn, String userPhone,
			String userEmail, String userAddress, String planName, String bizName, int planPrice, int planVoicel,
			int planMessage, int data) {
		this.orderNo = orderNo;
		this.userId = userId;
		this.planNo = planNo;
		this.joinCategory = joinCategory;
		this.simType = simType;
		this.simYn = simYn;
		this.currentTelecom = currentTelecom;
		this.planBill = planBill;
		this.planPay = planPay;
		this.cardNumber = cardNumber;
		this.cardExpiration = cardExpiration;
		this.bank = bank;
		this.bankNumber = bankNumber;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		NetNo = netNo;
		this.genN0 = genN0;
		this.orderPrice = orderPrice;
		this.orderData = orderData;
		this.orderVoice = orderVoice;
		this.orderMessage = orderMessage;
		this.userName = userName;
		this.userSsn = userSsn;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.planName = planName;
		this.bizName = bizName;
		this.planPrice = planPrice;
		this.planVoice = planVoice;
		this.planMessage = planMessage;
		this.data = data;
	}
	@Override
	public String toString() {
		return "BizApplyVo [orderNo=" + orderNo + ", userId=" + userId + ", planNo=" + planNo + ", joinCategory="
				+ joinCategory + ", simType=" + simType + ", simYn=" + simYn + ", currentTelecom=" + currentTelecom
				+ ", planBill=" + planBill + ", planPay=" + planPay + ", cardNumber=" + cardNumber + ", cardExpiration="
				+ cardExpiration + ", bank=" + bank + ", bankNumber=" + bankNumber + ", orderDate=" + orderDate
				+ ", orderStatus=" + orderStatus + ", NetNo=" + NetNo + ", genN0=" + genN0 + ", orderPrice="
				+ orderPrice + ", orderData=" + orderData + ", orderVoice=" + orderVoice + ", orderMessage="
				+ orderMessage + ", userName=" + userName + ", userSsn=" + userSsn + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userAddress=" + userAddress + ", planName=" + planName + ", bizName="
				+ bizName + ", planPrice=" + planPrice + ", planVoice=" + planVoice + ", planMessage=" + planMessage
				+ ", data=" + data + "]";
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public String getJoinCategory() {
		return joinCategory;
	}
	public void setJoinCategory(String joinCategory) {
		this.joinCategory = joinCategory;
	}
	public String getSimType() {
		return simType;
	}
	public void setSimType(String simType) {
		this.simType = simType;
	}
	public String getSimYn() {
		return simYn;
	}
	public void setSimYn(String simYn) {
		this.simYn = simYn;
	}
	public String getCurrentTelecom() {
		return currentTelecom;
	}
	public void setCurrentTelecom(String currentTelecom) {
		this.currentTelecom = currentTelecom;
	}
	public String getPlanBill() {
		return planBill;
	}
	public void setPlanBill(String planBill) {
		this.planBill = planBill;
	}
	public String getPlanPay() {
		return planPay;
	}
	public void setPlanPay(String planPay) {
		this.planPay = planPay;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardExpiration() {
		return cardExpiration;
	}
	public void setCardExpiration(String cardExpiration) {
		this.cardExpiration = cardExpiration;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBankNumber() {
		return bankNumber;
	}
	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getNetNo() {
		return NetNo;
	}
	public void setNetNo(int netNo) {
		NetNo = netNo;
	}
	public int getGenN0() {
		return genN0;
	}
	public void setGenN0(int genN0) {
		this.genN0 = genN0;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getOrderData() {
		return orderData;
	}
	public void setOrderData(int orderData) {
		this.orderData = orderData;
	}
	public int getOrderVoice() {
		return orderVoice;
	}
	public void setOrderVoice(int orderVoice) {
		this.orderVoice = orderVoice;
	}
	public int getOrderMessage() {
		return orderMessage;
	}
	public void setOrderMessage(int orderMessage) {
		this.orderMessage = orderMessage;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSsn() {
		return userSsn;
	}
	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public int getPlanPrice() {
		return planPrice;
	}
	public void setPlanPrice(int planPrice) {
		this.planPrice = planPrice;
	}
	public int getPlanVoice() {
		return planVoice;
	}
	public void setPlanVoice(int planVoice) {
		this.planVoice = planVoice;
	}
	public int getPlanMessage() {
		return planMessage;
	}
	public void setPlanMessage(int planMessage) {
		this.planMessage = planMessage;
	}
	public int getData() {
		return data;
	}
	public void setData(int data) {
		this.data = data;
	}
	
	
	
}
