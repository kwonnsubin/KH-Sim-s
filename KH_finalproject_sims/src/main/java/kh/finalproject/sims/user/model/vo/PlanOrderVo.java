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
public class PlanOrderVo {
	
	private int orderNo;
	private String userId;
	private int planNo;
	private String joinCategory;
	private String simType;
	private String simYn;
	private String currentTelecom;
	private String planBill;
	private String planPay;
	private Date orderDate;
	private String orderStatus;
	private int netNo;
	private int genNo;
	private int orderPrice;
	private int orderData;
	private int orderVoice;
	private int orderMessage;
	private String bizId;
	private String orderAddress;

}
