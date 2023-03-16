package kh.finalproject.sims.apiTest.vo;

import org.springframework.stereotype.Component;

@Component
public class FeeApiVo {
	
//	plan_no number PRIMARY KEY
//    , plan_voice varchar2(10 CHAR)NOT NULL
//    , plan_data varchar2(10 CHAR)NOT NULL
//    , plan_sms varchar2(10 CHAR)NOT NULL
//    , plan_age varchar2(2 CHAR)NOT NULL
//    , plan_type varchar2(1 CHAR)NOT NULL
//    , plan_dis varchar2(2 CHAR)NOT NULL
//    , plan_tel varchar2(100 CHAR)
//    , plan_price varchar2(100 CHAR)
//    , plan_dis_price varchar2(100 CHAR)
//    , plan_over varchar2(100 CHAR)
//    , plan_add_name varchar2(100 CHAR)
//    , plan_plan_name varchar2(100 CHAR)
//    , plan_display_voice varchar2(100 CHAR)
//    , plan_display_data varchar2(100 CHAR)
//    , plan_display_sms varchar2(100 CHAR)
//    , plan_rn varchar2(1 CHAR)
	
	private String planNo;
	private String planData;
	private String planSms;
	private String planAge;
	private String planType;
	private String planDis;
	private String planTel;
	private String planPrice;
	private String planDisPrice;
	private String planOver;
	private String planAddName;
	private String planName;
	private String planDisplayVoice;
	private String planDisplayData;
	private String planDisplaySms;
	private String planRn;
	
	@Override
	public String toString() {
		return "FeeApiVo [planNo=" + planNo + ", planData=" + planData + ", planSms=" + planSms + ", planAge=" + planAge
				+ ", planType=" + planType + ", planDis=" + planDis + ", planTel=" + planTel + ", planPrice="
				+ planPrice + ", planDisPrice=" + planDisPrice + ", planOver=" + planOver + ", planAddName="
				+ planAddName + ", planName=" + planName + ", planDisplayVoice=" + planDisplayVoice
				+ ", planDisplayData=" + planDisplayData + ", planDisplaySms=" + planDisplaySms + ", planRn=" + planRn
				+ "]";
	}

	public String getPlanNo() {
		return planNo;
	}

	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}

	public String getPlanData() {
		return planData;
	}

	public void setPlanData(String planData) {
		this.planData = planData;
	}

	public String getPlanSms() {
		return planSms;
	}

	public void setPlanSms(String planSms) {
		this.planSms = planSms;
	}

	public String getPlanAge() {
		return planAge;
	}

	public void setPlanAge(String planAge) {
		this.planAge = planAge;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	public String getPlanDis() {
		return planDis;
	}

	public void setPlanDis(String planDis) {
		this.planDis = planDis;
	}

	public String getPlanTel() {
		return planTel;
	}

	public void setPlanTel(String planTel) {
		this.planTel = planTel;
	}

	public String getPlanPrice() {
		return planPrice;
	}

	public void setPlanPrice(String planPrice) {
		this.planPrice = planPrice;
	}

	public String getPlanDisPrice() {
		return planDisPrice;
	}

	public void setPlanDisPrice(String planDisPrice) {
		this.planDisPrice = planDisPrice;
	}

	public String getPlanOver() {
		return planOver;
	}

	public void setPlanOver(String planOver) {
		this.planOver = planOver;
	}

	public String getPlanAddName() {
		return planAddName;
	}

	public void setPlanAddName(String planAddName) {
		this.planAddName = planAddName;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getPlanDisplayVoice() {
		return planDisplayVoice;
	}

	public void setPlanDisplayVoice(String planDisplayVoice) {
		this.planDisplayVoice = planDisplayVoice;
	}

	public String getPlanDisplayData() {
		return planDisplayData;
	}

	public void setPlanDisplayData(String planDisplayData) {
		this.planDisplayData = planDisplayData;
	}

	public String getPlanDisplaySms() {
		return planDisplaySms;
	}

	public void setPlanDisplaySms(String planDisplaySms) {
		this.planDisplaySms = planDisplaySms;
	}

	public String getPlanRn() {
		return planRn;
	}

	public void setPlanRn(String planRn) {
		this.planRn = planRn;
	}
	
}
