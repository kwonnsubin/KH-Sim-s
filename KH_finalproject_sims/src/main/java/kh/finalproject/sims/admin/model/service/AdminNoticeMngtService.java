package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
public interface AdminNoticeMngtService {

	    //관리자 공지사항 리스트 
		public List<AdminNoticeMngtVo> selectNoticeList();
		
		//관리자 공지사항 상세정보 
		public AdminNoticeMngtVo selectNoticeDetail(int ntcNo);
		
		//관리자 공지사항 작성 
		public int insertNoticeWrite(AdminNoticeMngtVo vo);

		//관리자 공지사항 글 삭제
		public int deleteNotice(int ntcNo);
		
		//관리자 공지사항 글 수정
		public int selectNoticeModify(AdminNoticeMngtVo vo);

		
		
		//public void saveNoticeModify(AdminNoticeMngtVo vo);
	
	
	
	


}
