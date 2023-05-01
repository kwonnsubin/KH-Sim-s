package kh.finalproject.sims.user.model.vo;

import java.sql.Date;
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
public class UserMemberVo {
	
	private String userId;
	private String userName;
	private String userSsn;
	private Date userWrDate;
	private Date userUpDate;
	private String userGender;
	private String userPhone;
	private String userEmail;
	
}
