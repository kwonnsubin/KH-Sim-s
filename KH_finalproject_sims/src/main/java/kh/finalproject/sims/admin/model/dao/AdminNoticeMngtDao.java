package kh.finalproject.sims.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;

@Repository
public class AdminNoticeMngtDao {
	
	@Autowired
	SqlSession sqlSession;

	//관리자 공지사항 리스트
	public List<AdminNoticeMngtVo> selectNoticeList(Map<String, Object> map) {
		return sqlSession.selectList("adminNotice.selectNoticeList", map);
	}
	
	//관리자  공지사항 리스트 전체 개수
		public int selectNoticeListCnt(Map<String, Object> map) {
			return sqlSession.selectOne("adminNotice.selectNoticeListCnt", map);
		}

	//관리자 공지사항 상세 페이지 호출
	public AdminNoticeMngtVo selectNoticeDetail(int ntcNo) {
		return sqlSession.selectOne("adminNotice.selectNoticeDetail", ntcNo);
	}
		
		
	//관리자 공지사항 작성 저장
	public int insertNoticeWrite(AdminNoticeMngtVo vo){
		return sqlSession.insert("adminNotice.insertNoticeWrite", vo);
	}

	//공지사항 글 삭제
	public int deleteNotice(int ntcNo) {
		return sqlSession.delete("adminNotice.deleteNotice", ntcNo);
	}

	//공지사항 글 수정 저장
	public int saveNoticeModify(AdminNoticeMngtVo vo) {
		return sqlSession.update("adminNotice.saveNoticeModify", vo);
	}
}
