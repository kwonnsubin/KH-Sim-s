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
public class CustomQueVo {
	private String userId;
	private int cqTelecom;
	private int cqData;
	private int cqSpeed;
	private int cqVoice;
}
