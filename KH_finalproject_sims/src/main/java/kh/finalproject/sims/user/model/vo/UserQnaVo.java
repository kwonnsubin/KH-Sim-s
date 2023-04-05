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
public class UserQnaVo {
	
	private int aqNo;
	private String userId;
	private String aqTitle;
	private String aqContent;
	private Timestamp aqDate;
	private Timestamp aqRedate;
	private int aqViews;
	private int aqAnswers;
	private String searchOption;
	private String searchBox;

}
