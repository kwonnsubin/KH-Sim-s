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
public class MemberVo {

	private String id;
	private String pw;
	private String role;
	private int enable;
	private String opinion;
	
}
