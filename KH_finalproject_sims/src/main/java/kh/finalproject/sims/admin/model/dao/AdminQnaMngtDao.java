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
// 문의 내역
public class AdminQnaMngtDao {
	
	@Autowired
	SqlSession sqlSession;
			
	// 리스트
	public List<AdminQnaMngtVo> selectQnaList() {
		return sqlSession.selectList("admin.selectQnaList");
	}
	
	// 검색
	public List<AdminQnaMngtVo> selectSearchQnaList(AdminQnaMngtVo vo) {
		return sqlSession.selectList("admin.selectSearchQnaList", vo);
	}
	
	// 상세보기
	public AdminQnaMngtVo selectQnaListDetail(int aqNo) {
		return sqlSession.selectOne("admin.selectQnaListDetail", aqNo);
	}
	
	// 문의글 삭제
	public int deleteQnaDetail(int aqNo) {
		return sqlSession.delete("admin.deleteQnaDetail", aqNo);
	}
	
	// 답변 리스트 ajax
	public List<AdminQnaAnsVo> selectQnaAnsList(int aqNo) {
		return sqlSession.selectList("admin.selectQnaAnsList", aqNo);
	}
	
	//  답변 작성
	public int insertQnaAnsWrite(AdminQnaAnsVo vo) {
		return sqlSession.insert("admin.insertQnaAnsWrite", vo);
	}
	
	// 답글 작성
	public int insertQnaReplyWrite(AdminQnaReplyVo vo) {
		return sqlSession.insert("admin.insertQnaReplyWrite", vo);
	}
	
	// 답변 삭제
	public int deleteQnaAns(int aaNo) {
		return sqlSession.delete("admin.deleteQnaAns", aaNo);
	}
	
	// 답변 수정
	public int updateQnaAns(AdminQnaAnsVo vo) {
		return sqlSession.update("admin.updateQnaAns", vo);
	}
	
	// 답글 리스트
	public List<AdminQnaReplyVo> selectQnaReplyList(int aaNo) {
		return sqlSession.selectList("admin.selectQnaReplyList", aaNo);
	}
	
	// 답글 등록 ajax
	public int insertReply(AdminQnaReplyVo vo) {
		return sqlSession.insert("admin.insertReply", vo);
	}
	
	// 답글 수정 ajax
	public int updateQnaReply(AdminQnaReplyVo vo) {
		return sqlSession.update("admin.updateQnaReply", vo);
	}
	
	// 답글 삭제 ajax
	public int deleteQnaReply(int rplNo) {
		return sqlSession.delete("admin.deleteQnaReply", rplNo);
	}

//	// 답변수 +1
//	public int upAnswerCount(int aaNo) {
//		return sqlSession.update("admin.upAnswerCount", aaNo);
//	}
//	
//	// 답변수 -1
//	public int downAnswerCount(int aaNo) {
//		return sqlSession.update("admin.downAnswerCount", aaNo);
//	}
	
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
	
	// 페이징 search
	public List<AdminFaqVo> searchQnaPageList(Map<String, Object> map) {
		return sqlSession.selectList("admin.searchQnaPageList", map);
	}
	
	// 글목록 총 갯수 search
	public int getSearchQnaListCnt(Map<String, Object> map) {
		return sqlSession.selectOne("admin.getSearchQnaPageCnt", map);
	}
	
}
