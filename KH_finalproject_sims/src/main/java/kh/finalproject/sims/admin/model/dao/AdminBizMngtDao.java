package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;

@Repository
public class AdminBizMngtDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<AdminBizMngtVo> selectBizApplyList(AdminBizMngtVo vo) {
		return sqlSession.selectList("adminBiz.selectBizApplyList", vo);
	}

}
