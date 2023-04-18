package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.common.page.Search;

// 자주묻는질문
public interface AdminFaqMngtService {
	
	// 목록보기
	public List<AdminFaqVo> selectFaqList();
	
	// 상세보기
	public AdminFaqVo selectFaqDetail(int faqNo);	
	
	// 작성하기
	public int insertFaqWrite(AdminFaqVo vo);
	
	// 수정하기
	public int selectFaqModify(AdminFaqVo vo);
	
	// 삭제하기
	public int deleteFaq(int faqNo);
	
	// 검색
	public List<AdminFaqVo> selectSearchFaqList(AdminFaqVo vo);
	
	// 페이징 search
	public Search getPage(int pNum, int cnt, String keyword, String searchType);
}
