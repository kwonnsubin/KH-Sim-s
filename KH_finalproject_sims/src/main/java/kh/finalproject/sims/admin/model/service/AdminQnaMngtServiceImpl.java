package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminQnaMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;

@Service
public class AdminQnaMngtServiceImpl implements AdminQnaMngtService{
	@Autowired
	AdminQnaMngtDao dao;
	
	// 자주묻는질문 목록
	@Override
	public List<AdminQnaMngtVo> selectFaqList() {
		return dao.selectFaqList();
	}

	// 자주묻는질문 상세보기
	@Override
	public AdminQnaMngtVo selectFaqDetail(int faqNo) {
		return dao.selectFaqDetail(faqNo);
	}

	@Override
	public int insertFaqWrite(AdminQnaMngtVo vo) {
		return dao.insertFaqWrite(vo);
	}

	@Override
	public int selectFaqModify(AdminQnaMngtVo vo) {
		return dao.selectFaqModify(vo);
	}

	@Override
	public int deleteFaq(int faqNo) {
		return dao.deleteFaq(faqNo);
	}

	// 문의 내역 리스트
	@Override
	public List<AdminQnaMngtVo> selectQnaList() {
		return dao.selectQnaList();
	}
	
	

}
