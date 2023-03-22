package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;

@Repository
public class AdminQnaMngtDao {
	
	@Autowired
	SqlSession sqlSession;
	
	// 자주묻는질문 리스트
	public List<AdminQnaMngtVo> selectQnaList() {
		return sqlSession.selectList("admin.selectQnaList");
	}
	
	// 자주묻는질문 상세보기
	public List<AdminQnaMngtVo> selectFaqDetail(int faqNo) {
		return sqlSession.selectList("admin.selectFaqDetail", faqNo);
	}
	
	// 자주묻는질문 작성하기
	public int insertFaqWrite(AdminQnaMngtVo vo) {
		return sqlSession.insert("admin.insertFaqWrite", vo);
	}
	
	// 자주묻는질문 수정하기
	public int selectFaqModify(AdminQnaMngtVo vo) {
		return sqlSession.update("admin.selectFaqModify", vo);
	}
	
	
	
}
