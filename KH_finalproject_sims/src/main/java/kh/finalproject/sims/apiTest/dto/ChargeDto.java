package kh.finalproject.sims.apiTest.dto;

import org.springframework.stereotype.Component;

@Component
public class ChargeDto {
	private String telecomName;
	private String bizName;
	private String chargeName;
	private String telecomGenerationType;
	private String chargeDiv;
	private String chargeAmount;
	private String voiceAmount;
	private String messageAmount;
	private String dataAmount;
	private String overVoiceAmtUnit;
	private String overMessageAmtUnit;
	private String overDataAmtUnit;
	
	
	public ChargeDto() {
		super();
	}

	public ChargeDto(String telecomName, String bizName, String chargeName, String telecomGenerationType,
			String chargeDiv, String chargeAmount, String voiceAmount, String messageAmount, String dataAmount,
			String overVoiceAmtUnit, String overMessageAmtUnit, String overDataAmtUnit) {
		super();
		this.telecomName = telecomName;
		this.bizName = bizName;
		this.chargeName = chargeName;
		this.telecomGenerationType = telecomGenerationType;
		this.chargeDiv = chargeDiv;
		this.chargeAmount = chargeAmount;
		this.voiceAmount = voiceAmount;
		this.messageAmount = messageAmount;
		this.dataAmount = dataAmount;
		this.overVoiceAmtUnit = overVoiceAmtUnit;
		this.overMessageAmtUnit = overMessageAmtUnit;
		this.overDataAmtUnit = overDataAmtUnit;
	}

	@Override
	public String toString() {
		return "ChargeDto [telecomName=" + telecomName + ", bizName=" + bizName + ", chargeName=" + chargeName
				+ ", telecomGenerationType=" + telecomGenerationType + ", chargeDiv=" + chargeDiv + ", chargeAmount="
				+ chargeAmount + ", voiceAmount=" + voiceAmount + ", messageAmount=" + messageAmount + ", dataAmount="
				+ dataAmount + ", overVoiceAmtUnit=" + overVoiceAmtUnit + ", overMessageAmtUnit=" + overMessageAmtUnit
				+ ", overDataAmtUnit=" + overDataAmtUnit + "]";
	}

	public String getTelecomName() {
		return telecomName;
	}

	public void setTelecomName(String telecomName) {
		this.telecomName = telecomName;
	}

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	public String getChargeName() {
		return chargeName;
	}

	public void setChargeName(String chargeName) {
		this.chargeName = chargeName;
	}

	public String getTelecomGenerationType() {
		return telecomGenerationType;
	}

	public void setTelecomGenerationType(String telecomGenerationType) {
		this.telecomGenerationType = telecomGenerationType;
	}

	public String getChargeDiv() {
		return chargeDiv;
	}

	public void setChargeDiv(String chargeDiv) {
		this.chargeDiv = chargeDiv;
	}

	public String getChargeAmount() {
		return chargeAmount;
	}

	public void setChargeAmount(String chargeAmount) {
		this.chargeAmount = chargeAmount;
	}

	public String getVoiceAmount() {
		return voiceAmount;
	}

	public void setVoiceAmount(String voiceAmount) {
		this.voiceAmount = voiceAmount;
	}

	public String getMessageAmount() {
		return messageAmount;
	}

	public void setMessageAmount(String messageAmount) {
		this.messageAmount = messageAmount;
	}

	public String getDataAmount() {
		return dataAmount;
	}

	public void setDataAmount(String dataAmount) {
		this.dataAmount = dataAmount;
	}

	public String getOverVoiceAmtUnit() {
		return overVoiceAmtUnit;
	}

	public void setOverVoiceAmtUnit(String overVoiceAmtUnit) {
		this.overVoiceAmtUnit = overVoiceAmtUnit;
	}

	public String getOverMessageAmtUnit() {
		return overMessageAmtUnit;
	}

	public void setOverMessageAmtUnit(String overMessageAmtUnit) {
		this.overMessageAmtUnit = overMessageAmtUnit;
	}

	public String getOverDataAmtUnit() {
		return overDataAmtUnit;
	}

	public void setOverDataAmtUnit(String overDataAmtUnit) {
		this.overDataAmtUnit = overDataAmtUnit;
	}
	
}
