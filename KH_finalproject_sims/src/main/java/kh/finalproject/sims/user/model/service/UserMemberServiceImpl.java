package kh.finalproject.sims.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.dao.UserMemberDao;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Service
public class UserMemberServiceImpl implements UserMemberService {

	@Autowired
	private UserMemberDao dao;
	
	// id 중복확인
	@Override
	public int selectIdCheck(String id) {
		
		return dao.selectIdCheck(id);
	}

	// 유저 회원가입
	@Override
	@Transactional
	public int insertUserSignUp(MemberVo memVo, UserMemberVo userVo) {
		int signUpMember = dao.signUpMember(memVo);
		
		int result = 0;
		if(signUpMember == 1) {
			result = dao.signUpUser(userVo);
		}
		
		return result;
	}

	// 통신사 회원가입
	@Override
	@Transactional
	public int insertBizSignUp(MemberVo memVo, BizInfoMngtVo bizVo) {
		int signUpMember = dao.signUpMember(memVo);
		
		int result = 0;
		if(signUpMember == 1) {
			result = dao.signUpBiz(bizVo);
		}
		
		return result;
	}

	// 유저 아이디 찾기
	@Override
	public MemberVo selectFindId(UserMemberVo userVo) {
		MemberVo memVo = new MemberVo();
		memVo.setId(dao.selectFindId(userVo));
		if(memVo.getId() != null) {
			memVo.setEnable(dao.checkEna(memVo.getId()));
		}
		
		return memVo;
	}

	// 통신사 아이디 찾기
	@Override
	public MemberVo selectFindId(BizInfoMngtVo bizVo) {
		MemberVo memVo = new MemberVo();
		memVo.setId(dao.selectFindId(bizVo));
		if(memVo.getId() != null) {
			memVo.setEnable(dao.checkEna(bizVo.getBizId()));
		}
		
		return memVo;
	}

	// 유저 비밀번호 찾기
	@Override
	public int selectFindPw(UserMemberVo userVo) {
		int result = dao.selectFindPw(userVo);
		return result;
	}

	// 통신사 비밀번호 찾기
	@Override
	public int selectFindPw(BizInfoMngtVo bizVo) {
		int result = dao.selectFindPw(bizVo);
		return result;
	}

	// 비밀번호 재설정
	@Override
	public int changePw(MemberVo memVo) {
		int result = dao.changePw(memVo);
		return result;
	}

	// 계정 복구
	@Override
	public int updateEnable(String id) {
		return dao.updateEnable(id);
	}
	
	// 계정 탈퇴
	@Override
	public int updateDisable(String id) {
		return dao.updateDisable(id);
	}

	// 유저 정보 가져오기
	@Override
	public UserMemberVo selectMyPageInfo(String id) {
		return dao.selectMyPageInfo(id);
	}

	// 유저 정보 수정
	@Override
	@Transactional
	public void updateMyPageModify(MemberVo memVo, UserMemberVo userVo) {
		int result = dao.changePw(memVo);
		if(result == 1) {
			dao.updateMyPageModify(userVo);
		}
	}

}
