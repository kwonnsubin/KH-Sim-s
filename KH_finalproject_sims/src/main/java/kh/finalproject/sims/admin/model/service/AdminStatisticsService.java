package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;

public interface AdminStatisticsService {
	
	// 요금제 랭킹 - 가입자 많은 순
	public List<AdminStatisticsVo> selectOrderByRegistration();
}
