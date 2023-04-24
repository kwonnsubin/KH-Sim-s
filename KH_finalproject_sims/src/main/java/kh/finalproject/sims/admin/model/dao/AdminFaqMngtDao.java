package kh.finalproject.sims.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminFaqVo;

// 자주묻는질문
@Repository
public class AdminFaqMngtDao {
	
	@Autowired
	SqlSession sqlSession;

	// 리스트
	public List<AdminFaqVo> selectFaqList() {
		return sqlSession.selectList("admin.selectFaqList");
	}
	
	// 상세보기
	public AdminFaqVo selectFaqDetail(int faqNo) {
		return sqlSession.selectOne("admin.selectFaqDetail", faqNo);
	}
	
	// 작성하기
	public int insertFaqWrite(AdminFaqVo vo) {
		return sqlSession.insert("admin.insertFaqWrite", vo);
	}
	
	// 수정하기
	public int selectFaqModify(AdminFaqVo vo) {
		return sqlSession.update("admin.selectFaqModify", vo);
	}
	
	// 삭제하기
	public int deleteFaq(int faqNo) {
		return sqlSession.delete("admin.deleteFaq", faqNo);
	}
	
	// 검색
	public List<AdminFaqVo> selectSearchFaqList(AdminFaqVo vo) {
		return sqlSession.selectList("admin.selectSearchFaqList", vo);
	}
	
	// search
	public List<AdminFaqVo> searchFaqPageList(Map<String, Object> map) {
		return sqlSession.selectList("admin.searchFaqPageList", map); // 한 페이지의 글 목록
	}
	
	// 글 개수
	public int getSearchFaqListCnt(Map<String, Object> map) {
		return sqlSession.selectOne("admin.getSearchFaqListCnt", map);
	}
}
