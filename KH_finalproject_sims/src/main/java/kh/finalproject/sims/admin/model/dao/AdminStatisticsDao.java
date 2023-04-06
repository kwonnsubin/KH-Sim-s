package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;

@Repository
public class AdminStatisticsDao {
	@Autowired
	SqlSession sqlSession;
	
	// 요금제 랭킹 - 가입자 많은 순
	public List<AdminStatisticsVo> selectOrderByRegistration() {
		return sqlSession.selectList("admin.selectOrderByRegistration");
	}
}
