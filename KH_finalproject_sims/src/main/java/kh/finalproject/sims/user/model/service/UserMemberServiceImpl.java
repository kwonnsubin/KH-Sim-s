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
	public int selectIdCheck(String id) throws Exception {
		
		return dao.selectIdCheck(id);
	}

	// 유저 회원가입
	@Override
	@Transactional
	public int insertUserSignUp(MemberVo memVo, UserMemberVo userVo) throws Exception {
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
	public int insertBizSignUp(MemberVo memVo, BizInfoMngtVo bizVo) throws Exception {
		int signUpMember = dao.signUpMember(memVo);
		
		int result = 0;
		if(signUpMember == 1) {
			result = dao.signUpBiz(bizVo);
		}
		
		return result;
	}

	// 유저 아이디 찾기
	@Override
	public MemberVo selectFindId(UserMemberVo userVo) throws Exception {
		MemberVo memVo = new MemberVo();
		memVo.setId(dao.selectFindId(userVo));
		if(memVo.getId() != null) {
			memVo.setEnable(dao.checkEna(memVo.getId()));
		}
		
		return memVo;
	}

	// 통신사 아이디 찾기
	@Override
	public MemberVo selectFindId(BizInfoMngtVo bizVo) throws Exception {
		MemberVo memVo = new MemberVo();
		memVo.setId(dao.selectFindId(bizVo));
		if(memVo.getId() != null) {
			memVo.setEnable(dao.checkEna(bizVo.getBizId()));
		}
		
		return memVo;
	}

	// 유저 비밀번호 찾기
	@Override
	public MemberVo selectFindPw(UserMemberVo userVo) throws Exception {
		MemberVo result = dao.selectFindPw(userVo);
		return result;
	}
	
	// 계정 복구
	@Override
	public int updateEnable(String id) throws Exception {
		return dao.updateEnable(id);
	}

	// 통신사 비밀번호 찾기
	@Override
	public int selectFindPw(BizInfoMngtVo bizVo) throws Exception {
		int result = dao.selectFindPw(bizVo);
		return result;
	}

	// 비밀번호 재설정
	@Override
	public int changePw(MemberVo memVo) throws Exception {
		int result = dao.changePw(memVo);
		return result;
	}
	
	/* 카카오 로그인 */
    @Override
    @Transactional
    public void kakaoJoin(MemberVo memberVo, UserMemberVo userMemberVo) throws Exception {
        int result = dao.kakaoInsert(memberVo);
        if(result == 1) {
        	dao.kakaoInsertUserMember(userMemberVo);
        }
    }

    @Override
    public MemberVo kakaoLogin(String snsId) throws Exception {
        return dao.kakaoSelect(snsId);
    }

    @Override
    public MemberVo findByUserId(String snsId) throws Exception {
        return dao.kakaoSelect(snsId);
    }

    // 로그인 한 이름
	@Override
	public String getUserName(String userId) throws Exception {
		return dao.getUserName(userId);
	}
	
	// 로그인 한 통신사 이름
	@Override
	public String getBizName(String bizId) throws Exception {
		return dao.getBizName(bizId);
	}

}
