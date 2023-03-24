package kh.finalproject.sims.biz.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
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
	private String logoRenameFilename;

	
	private List<bizInfoMngServiceVo> serviceList;
	
	public BizInfoMngtVo(String bizId, String bizName, String bizSsn, String bizCrn, String bizEmail, String bizPhone,
			String bizFax, String bizOwnerName, String bizHp, int bizZipCode, String bizLocation, String bizCardPayDate,
			String bizAccPayDate, String bizBeginTime, String bizEndTime, String bizClosedDay, int bizReviewStar,
			String phoneOpTime, String phoneOpTimeUsim, String network, Date writeDate, Date updateDate,
			String logoRenameFilename, List<bizInfoMngServiceVo> serviceList) {
		this.bizId = bizId;
		this.bizName = bizName;
		this.bizSsn = bizSsn;
		this.bizCrn = bizCrn;
		this.bizEmail = bizEmail;
		this.bizPhone = bizPhone;
		this.bizFax = bizFax;
		this.bizOwnerName = bizOwnerName;
		this.bizHp = bizHp;
		this.bizZipCode = bizZipCode;
		this.bizLocation = bizLocation;
		this.bizCardPayDate = bizCardPayDate;
		this.bizAccPayDate = bizAccPayDate;
		this.bizBeginTime = bizBeginTime;
		this.bizEndTime = bizEndTime;
		this.bizClosedDay = bizClosedDay;
		this.bizReviewStar = bizReviewStar;
		this.phoneOpTime = phoneOpTime;
		this.phoneOpTimeUsim = phoneOpTimeUsim;
		this.network = network;
		this.writeDate = writeDate;
		this.updateDate = updateDate;
		this.logoRenameFilename = logoRenameFilename;
		this.serviceList = serviceList;
	}
	

	public List<bizInfoMngServiceVo> getServiceList() {
		return serviceList;
	}

	public void setServiceList(List<bizInfoMngServiceVo> serviceList) {
		this.serviceList = serviceList;
	}

	public BizInfoMngtVo() {}

	@Override
	public String toString() {
		return "BizInfoMngtVo [bizId=" + bizId + ", bizName=" + bizName + ", bizSsn=" + bizSsn + ", bizCrn=" + bizCrn
				+ ", bizEmail=" + bizEmail + ", bizPhone=" + bizPhone + ", bizFax=" + bizFax + ", bizOwnerName="
				+ bizOwnerName + ", bizHp=" + bizHp + ", bizZipCode=" + bizZipCode + ", bizLocation=" + bizLocation
				+ ", bizCardPayDate=" + bizCardPayDate + ", bizAccPayDate=" + bizAccPayDate + ", bizBeginTime="
				+ bizBeginTime + ", bizEndTime=" + bizEndTime + ", bizClosedDay=" + bizClosedDay + ", bizReviewStar="
				+ bizReviewStar + ", phoneOpTime=" + phoneOpTime + ", phoneOpTimeUsim=" + phoneOpTimeUsim + ", network="
				+ network + ", writeDate=" + writeDate + ", updateDate=" + updateDate + ", logoRenameFilename="
				+ logoRenameFilename + ", serviceList=" + serviceList + "]";
	}
	public String getBizId() {
		return bizId;
	}
	public void setBizId(String bizId) {
		this.bizId = bizId;
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
	public String getBizHp() {
		return bizHp;
	}
	public void setBizHp(String bizHp) {
		this.bizHp = bizHp;
	}
	public int getBizZipCode() {
		return bizZipCode;
	}
	public void setBizZipCode(int bizZipCode) {
		this.bizZipCode = bizZipCode;
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
