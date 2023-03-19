package kh.finalproject.sims.biz.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BizVo {
//	-------------------- -------- ------------- 
//	BIZ_NO               NOT NULL NUMBER        
//	BIZ_NAME                      VARCHAR2(20)  
//	BIZ_SSN                       VARCHAR2(30)  
//	BIZ_CRN                       VARCHAR2(20)  
//	BIZ_ID                        VARCHAR2(30)  
//	BIZ_PW                        VARCHAR2(30)  
//	BIZ_EMAIL                     VARCHAR2(50)  
//	BIZ_PHONE                     VARCHAR2(20)  
//	BIZ_FAX                       VARCHAR2(20)  
//	BIZ_OWNER_NAME                VARCHAR2(10)  
//	BIZ_HP                        VARCHAR2(100) 
//	BIZ_LOCATION                  VARCHAR2(200) 
//	BIZ_CARD_PAY_DATE             VARCHAR2(20)  
//	BIZ_ACC_PAY_DATE              VARCHAR2(20)  
//	BIZ_CERTIFY                   VARCHAR2(10)  
//	BIZ_BEGIN_TIME                VARCHAR2(20)  
//	BIZ_END_TIME                  VARCHAR2(20)  
//	BIZ_CLOSED_DAY                VARCHAR2(20)  
//	SERVICE_SKT                   VARCHAR2(20)  
//	SERVICE_KT                    VARCHAR2(20)  
//	SERVICE_LGU                   VARCHAR2(20)  
//	PAYMENT_CARD                  VARCHAR2(50)  
//	PAYMENT_ACC                   VARCHAR2(50)  
//	BIZ_REVIEW_STAR               NUMBER        
//	PHONE_OP_TIME                 VARCHAR2(20)  
//	PHONE_OP_TIME_USIM            VARCHAR2(20)  
//	NETWORK                       VARCHAR2(50)  
//	WRITE_DATE           NOT NULL DATE          
//	UPDATE_DATE                   DATE          
//	LOGO_RENAME_FILENAME          VARCHAR2(100)
	
	private int bizNo;
	private String bizName;
	private String bizSsn;
	private String bizCrn;
	private String bizId;
	private String bizPw;
	private String bizEmail;
	private String bizPhone;
	private String bizFax;
	private String bizOwnerName;
	private String bizHip;
	private String bizLocation;
	private String bizCardPayDate;
	private String bizAccPayDate;
	private String bizCertify;
	private String bizBeginTime;
	private String bizEndTime;
	private String bizClosedDay;
	private String serviceSKT;
	private String serviceKT;
	private String serviceLGU;
	private String paymentCard;
	private String paymentAcc;
	private int bizReviewStar;
	private String phoneOpTime;
	private String phoneOpTimeUsim;
	private String network;
	private Date writeDate;
	private Date updateDate;
	private String logoRenameFilename;
	
	
	@Override
	public String toString() {
		return "BizVo [bizNo=" + bizNo + ", bizName=" + bizName + ", bizSsn=" + bizSsn + ", bizCrn=" + bizCrn
				+ ", bizId=" + bizId + ", bizPw=" + bizPw + ", bizEmail=" + bizEmail + ", bizPhone=" + bizPhone
				+ ", bizFax=" + bizFax + ", bizOwnerName=" + bizOwnerName + ", bizHip=" + bizHip + ", bizLocation="
				+ bizLocation + ", bizCardPayDate=" + bizCardPayDate + ", bizAccPayDate=" + bizAccPayDate
				+ ", bizCertify=" + bizCertify + ", bizBeginTime=" + bizBeginTime + ", bizEndTime=" + bizEndTime
				+ ", bizClosedDay=" + bizClosedDay + ", serviceSKT=" + serviceSKT + ", serviceKT=" + serviceKT
				+ ", serviceLGU=" + serviceLGU + ", paymentCard=" + paymentCard + ", paymentAcc=" + paymentAcc
				+ ", bizReviewStar=" + bizReviewStar + ", phoneOpTime=" + phoneOpTime + ", phoneOpTimeUsim="
				+ phoneOpTimeUsim + ", network=" + network + ", writeDate=" + writeDate + ", updateDate=" + updateDate
				+ ", logoRenameFilename=" + logoRenameFilename + "]";
	}
	public BizVo() {}
	public BizVo(int bizNo, String bizName, String bizSsn, String bizCrn, String bizId, String bizPw, String bizEmail,
			String bizPhone, String bizFax, String bizOwnerName, String bizHip, String bizLocation,
			String bizCardPayDate, String bizAccPayDate, String bizCertify, String bizBeginTime, String bizEndTime,
			String bizClosedDay, String serviceSKT, String serviceKT, String serviceLGU, String paymentCard,
			String paymentAcc, int bizReviewStar, String phoneOpTime, String phoneOpTimeUsim, String network,
			Date writeDate, Date updateDate, String logoRenameFilename) {
		super();
		this.bizNo = bizNo;
		this.bizName = bizName;
		this.bizSsn = bizSsn;
		this.bizCrn = bizCrn;
		this.bizId = bizId;
		this.bizPw = bizPw;
		this.bizEmail = bizEmail;
		this.bizPhone = bizPhone;
		this.bizFax = bizFax;
		this.bizOwnerName = bizOwnerName;
		this.bizHip = bizHip;
		this.bizLocation = bizLocation;
		this.bizCardPayDate = bizCardPayDate;
		this.bizAccPayDate = bizAccPayDate;
		this.bizCertify = bizCertify;
		this.bizBeginTime = bizBeginTime;
		this.bizEndTime = bizEndTime;
		this.bizClosedDay = bizClosedDay;
		this.serviceSKT = serviceSKT;
		this.serviceKT = serviceKT;
		this.serviceLGU = serviceLGU;
		this.paymentCard = paymentCard;
		this.paymentAcc = paymentAcc;
		this.bizReviewStar = bizReviewStar;
		this.phoneOpTime = phoneOpTime;
		this.phoneOpTimeUsim = phoneOpTimeUsim;
		this.network = network;
		this.writeDate = writeDate;
		this.updateDate = updateDate;
		this.logoRenameFilename = logoRenameFilename;
	}
	public int getBizNo() {
		return bizNo;
	}
	public void setBizNo(int bizNo) {
		this.bizNo = bizNo;
	}
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public String getBizSsn() {
		return bizSsn;
	}
	public void setBizSsn(String bizSsn) {
		this.bizSsn = bizSsn;
	}
	public String getBizCrn() {
		return bizCrn;
	}
	public void setBizCrn(String bizCrn) {
		this.bizCrn = bizCrn;
	}
	public String getBizId() {
		return bizId;
	}
	public void setBizId(String bizId) {
		this.bizId = bizId;
	}
	public String getBizPw() {
		return bizPw;
	}
	public void setBizPw(String bizPw) {
		this.bizPw = bizPw;
	}
	public String getBizEmail() {
		return bizEmail;
	}
	public void setBizEmail(String bizEmail) {
		this.bizEmail = bizEmail;
	}
	public String getBizPhone() {
		return bizPhone;
	}
	public void setBizPhone(String bizPhone) {
		this.bizPhone = bizPhone;
	}
	public String getBizFax() {
		return bizFax;
	}
	public void setBizFax(String bizFax) {
		this.bizFax = bizFax;
	}
	public String getBizOwnerName() {
		return bizOwnerName;
	}
	public void setBizOwnerName(String bizOwnerName) {
		this.bizOwnerName = bizOwnerName;
	}
	public String getBizHip() {
		return bizHip;
	}
	public void setBizHip(String bizHip) {
		this.bizHip = bizHip;
	}
	public String getBizLocation() {
		return bizLocation;
	}
	public void setBizLocation(String bizLocation) {
		this.bizLocation = bizLocation;
	}
	public String getBizCardPayDate() {
		return bizCardPayDate;
	}
	public void setBizCardPayDate(String bizCardPayDate) {
		this.bizCardPayDate = bizCardPayDate;
	}
	public String getBizAccPayDate() {
		return bizAccPayDate;
	}
	public void setBizAccPayDate(String bizAccPayDate) {
		this.bizAccPayDate = bizAccPayDate;
	}
	public String getBizCertify() {
		return bizCertify;
	}
	public void setBizCertify(String bizCertify) {
		this.bizCertify = bizCertify;
	}
	public String getBizBeginTime() {
		return bizBeginTime;
	}
	public void setBizBeginTime(String bizBeginTime) {
		this.bizBeginTime = bizBeginTime;
	}
	public String getBizEndTime() {
		return bizEndTime;
	}
	public void setBizEndTime(String bizEndTime) {
		this.bizEndTime = bizEndTime;
	}
	public String getBizClosedDay() {
		return bizClosedDay;
	}
	public void setBizClosedDay(String bizClosedDay) {
		this.bizClosedDay = bizClosedDay;
	}
	public String getServiceSKT() {
		return serviceSKT;
	}
	public void setServiceSKT(String serviceSKT) {
		this.serviceSKT = serviceSKT;
	}
	public String getServiceKT() {
		return serviceKT;
	}
	public void setServiceKT(String serviceKT) {
		this.serviceKT = serviceKT;
	}
	public String getServiceLGU() {
		return serviceLGU;
	}
	public void setServiceLGU(String serviceLGU) {
		this.serviceLGU = serviceLGU;
	}
	public String getPaymentCard() {
		return paymentCard;
	}
	public void setPaymentCard(String paymentCard) {
		this.paymentCard = paymentCard;
	}
	public String getPaymentAcc() {
		return paymentAcc;
	}
	public void setPaymentAcc(String paymentAcc) {
		this.paymentAcc = paymentAcc;
	}
	public int getBizReviewStar() {
		return bizReviewStar;
	}
	public void setBizReviewStar(int bizReviewStar) {
		this.bizReviewStar = bizReviewStar;
	}
	public String getPhoneOpTime() {
		return phoneOpTime;
	}
	public void setPhoneOpTime(String phoneOpTime) {
		this.phoneOpTime = phoneOpTime;
	}
	public String getPhoneOpTimeUsim() {
		return phoneOpTimeUsim;
	}
	public void setPhoneOpTimeUsim(String phoneOpTimeUsim) {
		this.phoneOpTimeUsim = phoneOpTimeUsim;
	}
	public String getNetwork() {
		return network;
	}
	public void setNetwork(String network) {
		this.network = network;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getLogoRenameFilename() {
		return logoRenameFilename;
	}
	public void setLogoRenameFilename(String logoRenameFilename) {
		this.logoRenameFilename = logoRenameFilename;
	}
	
	
}
