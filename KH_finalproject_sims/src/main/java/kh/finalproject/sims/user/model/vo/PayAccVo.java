package kh.finalproject.sims.user.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PayAccVo {
	
	private int orderNo;
	private String accHolder;
	private String accSsn;
	private int accRelationship;
	private String accNumber;
	private String accBank;

}
