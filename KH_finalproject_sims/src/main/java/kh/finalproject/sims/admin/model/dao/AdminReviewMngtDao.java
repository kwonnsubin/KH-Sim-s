package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

@Repository
public class AdminReviewMngtDao {
	@Autowired
	SqlSession sqlSession;
	
	public List<AdminReviewMngtVo> selectReviewReportList() {
		return sqlSession.selectList("admin.selectReviewReportList");
	}
	
	
}
