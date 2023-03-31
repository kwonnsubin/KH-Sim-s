package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

@Repository
public class AdminDashBoardDao {
	@Autowired
	SqlSession sqlSesson;
	
	// 리뷰 리스트
	public List<AdminReviewMngtVo> selectDashboardBizReview() {
		return sqlSesson.selectList("admin.selectDashboardBizReview");
	}
}
