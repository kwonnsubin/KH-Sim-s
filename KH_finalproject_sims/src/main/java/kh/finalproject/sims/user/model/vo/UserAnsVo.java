package kh.finalproject.sims.user.model.vo;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class UserAnsVo {
	
	private int aaNo;
	private int aqNo;
	private String adminId;
	private String userId;
	private String aaContent;
	private Timestamp aaDate;
	private Timestamp aaRedate;
	private List<UserRplVo> aaRpls;

}
