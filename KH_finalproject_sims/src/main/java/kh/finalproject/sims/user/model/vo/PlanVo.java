package kh.finalproject.sims.user.model.vo;

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
public class PlanVo {

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
	private String netName;
	private String genName;
	
	// bizId
	private String bizId;
	
}
