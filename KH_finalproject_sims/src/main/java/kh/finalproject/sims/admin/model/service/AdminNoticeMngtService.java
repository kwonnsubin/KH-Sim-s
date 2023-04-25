package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.common.page.Search;
public interface AdminNoticeMngtService {

	    //관리자 공지사항 리스트 
		public Search selectNoticeList(int pNum, int cnt, String searchOption, String searchBox) throws Exception;
		
		//관리자 공지사항 상세정보/수정 페이지 호출
		public AdminNoticeMngtVo selectNoticeDetail(int ntcNo);
		
		//관리자 공지사항 작성 저장
		public int insertNoticeWrite(AdminNoticeMngtVo vo);

		//관리자 공지사항 글 삭제
		public int deleteNotice(int ntcNo);

		//관리자 공지사항 글 수정 페이지 수정 저장
		public int saveNoticeModify(AdminNoticeMngtVo vo);
}
