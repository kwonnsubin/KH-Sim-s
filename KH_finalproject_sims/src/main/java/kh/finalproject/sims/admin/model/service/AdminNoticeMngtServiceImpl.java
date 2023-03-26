package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.admin.model.dao.AdminNoticeMngtDao;

@Service
public class AdminNoticeMngtServiceImpl implements AdminNoticeMngtService{

	
	@Autowired
	private AdminNoticeMngtDao dao;
	
	
	    //관리자 공지사항 리스트
		@Override
		public List<AdminNoticeMngtVo> selectNoticeList(){
			return dao.selectNoticeList();
		}
		
		//관리자 공지사항 상세
		@Override
		public AdminNoticeMngtVo selectNoticeDetail(int ntcNo){
			return dao.selectNoticeDetail(ntcNo);
		}
		
		//관리자 공지사항 글 작성
		@Override
		public int insertNoticeWrite(AdminNoticeMngtVo vo){
			return dao.insertNoticeWrite(vo);
		}

		//관리자 공지사항 글 삭제
		@Override
		public int deleteNotice(int ntcNo) {
			return dao.deleteNotice(ntcNo);
		}
		
		//관리자 공지사항 글 수정
		@Override
		public int selectNoticeModify(AdminNoticeMngtVo vo) {
			return dao.selectNoticeModify(vo);
		}
	
	
}
