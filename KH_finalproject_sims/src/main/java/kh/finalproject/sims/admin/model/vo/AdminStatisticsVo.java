package kh.finalproject.sims.admin.model.vo;

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
public class AdminStatisticsVo {
	private int planNo;
	private String planName;
	private String bizName; 
	private int cnt; 
}
