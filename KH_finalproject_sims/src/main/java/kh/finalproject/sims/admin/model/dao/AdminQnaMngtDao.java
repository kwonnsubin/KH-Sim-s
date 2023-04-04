package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaAnsVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaReplyVo;

@Repository
public class AdminQnaMngtDao {
	
	@Autowired
	SqlSession sqlSession;
	
	// 자주묻는질문 리스트
	public List<AdminFaqVo> selectFaqList() {
		return sqlSession.selectList("admin.selectFaqList");
	}
	
	// 자주묻는질문 상세보기
	public AdminFaqVo selectFaqDetail(int faqNo) {
		return sqlSession.selectOne("admin.selectFaqDetail", faqNo);
	}
	
	// 자주묻는질문 작성하기
	public int insertFaqWrite(AdminFaqVo vo) {
		return sqlSession.insert("admin.insertFaqWrite", vo);
	}
	
	// 자주묻는질문 수정하기
	public int selectFaqModify(AdminFaqVo vo) {
		return sqlSession.update("admin.selectFaqModify", vo);
	}
	
	// 자주묻는질문 삭제하기
	public int deleteFaq(int faqNo) {
		return sqlSession.delete("admin.deleteFaq", faqNo);
	}
	
	// 자주묻는질문 검색
	public List<AdminFaqVo> selectSearchFaqList(AdminFaqVo vo) {
		return sqlSession.selectList("admin.selectSearchFaqList", vo);
	}
	
	// 문의 내역 리스트
	public List<AdminQnaMngtVo> selectQnaList() {
		return sqlSession.selectList("admin.selectQnaList");
	}
	
	// 문의 내역 검색
	public List<AdminQnaMngtVo> selectSearchQnaList(AdminQnaMngtVo vo) {
		return sqlSession.selectList("admin.selectSearchQnaList", vo);
	}
	
	// 문의 내역 상세보기
	public AdminQnaMngtVo selectQnaListDetail(int aqNo) {
		return sqlSession.selectOne("admin.selectQnaListDetail", aqNo);
	}
	
//	// 문의 내역 상세보기 JOIN
//	public List<AdminQnaMngtVo> selectQnaListDetail(int aqNo) {
//		return sqlSession.selectList("admin.selectQnaListDetail", aqNo);
//	}
	
	// 문의 내역 답변 리스트
	public List<AdminQnaAnsVo> selectQnaAnsList(int aqNo) {
		return sqlSession.selectList("admin.selectQnaAnsList", aqNo);
	}
	
	// 문의 내역 댓글 리스트
//	public List<AdminQnaMngtVo> selectQnaReplyList(int aaNo) {
//		return sqlSession.selectList("admin.selectQnaReplyList", aaNo);
//	}
	
	// 문의 내역 답변 작성
	public int insertQnaAnsWrite(AdminQnaAnsVo vo) {
		return sqlSession.insert("admin.insertQnaAnsWrite", vo);
	}
	
	// 문의 내역 댓글 작성
	public int insertQnaReplyWrite(AdminQnaReplyVo vo) {
		return sqlSession.insert("admin.insertQnaReplyWrite", vo);
	}
	
	// 문의 내역 답변 삭제
	public int deleteQnaAns(int aaNo) {
		return sqlSession.delete("admin.deleteQnaAns", aaNo);
	}
	
	// 문의 내역 답변 수정
	public int updateQnaAns(AdminQnaAnsVo vo) {
		return sqlSession.update("admin.updateQnaAns", vo);
	}
	
	
}
