package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminStatisticsDao;
import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;

@Service 
public class AdminStatisticsServiceImpl implements AdminStatisticsService {
	@Autowired
	AdminStatisticsDao dao;
	
	// 요금제 랭킹 - 가입자 많은 순
	@Override
	public List<AdminStatisticsVo> selectOrderByRegistration() {
		return dao.selectOrderByRegistration();
	}

}
