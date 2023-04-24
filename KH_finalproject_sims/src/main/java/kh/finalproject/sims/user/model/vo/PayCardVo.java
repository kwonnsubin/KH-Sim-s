package kh.finalproject.sims.user.model.vo;

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
public class PayCardVo {
	
	private int orderNo;
	private String cardHolder;
	private String cardSsn;
	private int cardRelationship;
	private String cardNumber;
	private String cardExpiration;

}
