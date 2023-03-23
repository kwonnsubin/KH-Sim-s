package kh.finalproject.sims.admin.model.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;

@Repository
public class AdminNoticeMngtDao {
	
	@Autowired
	SqlSession sqlSession;

	public List<AdminNoticeMngtVo> selectNoticeList() {
		return sqlSession.selectList("adminNotice.selectNoticeList");
	}

}
