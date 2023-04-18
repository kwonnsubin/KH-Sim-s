package kh.finalproject.sims.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaAnsVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaReplyVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

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
	
	
	
	
	// 자주묻는질문 Paging search
	public List<AdminFaqVo> searchFaqPageList(Map<String, Object> map) {
		return sqlSession.selectList("admin.searchFaqPageList", map); // 한 페이지의 글 목록
	}
	// 자주묻는질문 글목록 총 갯수 search
	public int getSearchFaqListCnt() {
		return sqlSession.selectOne("admin.getSearchFaqListCnt");
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
	
	// 문의 내역 답변 리스트 ajax
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
	
	// 문의 내역 답글 리스트
	public List<AdminQnaReplyVo> selectQnaReplyList(int aaNo) {
		return sqlSession.selectList("admin.selectQnaReplyList", aaNo);
	}
	
	// 문의 내역 답글 등록 ajax
	public int insertReply(AdminQnaReplyVo vo) {
		return sqlSession.insert("admin.insertReply", vo);
	}
	
	// 문의 내역 답글 수정 ajax
	public int updateQnaReply(AdminQnaReplyVo vo) {
		return sqlSession.update("admin.updateQnaReply", vo);
	}
	
	// 문의 내역 답글 삭제 ajax
	public int deleteQnaReply(int rplNo) {
		return sqlSession.delete("admin.deleteQnaReply", rplNo);
	}
	
	// 답변수 +1
	public int upAnswerCount(int aaNo) {
		return sqlSession.update("admin.upAnswerCount", aaNo);
	}
	
	// 답변수 -1
	public int downAnswerCount(int aaNo) {
		return sqlSession.update("admin.downAnswerCount", aaNo);
	}
	
	// 답변수 조회 ajax
	public int selectAnswerCount(int aqNo) {
		return sqlSession.selectOne("admin.selectAnswerCount", aqNo);
	}
	
	// 조회수 증가
	public int viewUp(int aqNo) {
		return sqlSession.update("admin.viewUp", aqNo);
	}
	
	// 조회수 조회 ajax
	public int selectViewCount(int aqNo) {
		return sqlSession.selectOne("admin.selectViewCount", aqNo);
	}
	
}
