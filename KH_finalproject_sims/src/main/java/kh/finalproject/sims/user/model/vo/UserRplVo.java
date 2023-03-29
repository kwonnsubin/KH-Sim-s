package kh.finalproject.sims.user.model.vo;

import java.sql.Timestamp;

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
public class UserRplVo {
	
	private int rplNo;
	private int aaNo;
	private Timestamp rplDate;
	private Timestamp rplRedate;
	private String rplContent;
	private String userId;
	private String adminId;
	
}
