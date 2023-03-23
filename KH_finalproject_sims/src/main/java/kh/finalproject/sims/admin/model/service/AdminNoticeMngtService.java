package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
public interface AdminNoticeMngtService {

	//공지사항 리스트 호출
	public List<AdminNoticeMngtVo> selectNoticeList(); 
		


}
