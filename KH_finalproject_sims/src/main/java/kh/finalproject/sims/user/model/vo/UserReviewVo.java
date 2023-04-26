package kh.finalproject.sims.user.model.vo;

import java.sql.Timestamp;

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
public class UserReviewVo {
	
	private int reviewNo;
	private String reviewContent;
	private Timestamp reviewDate;
	private Timestamp reviewRedate;
	private float reviewStar;
	private String userId;
	private String bizId;
	private int reviewHidden;
}
