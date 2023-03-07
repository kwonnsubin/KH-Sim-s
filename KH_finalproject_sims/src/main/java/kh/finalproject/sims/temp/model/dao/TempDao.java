package kh.finalproject.sims.temp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.temp.model.vo.TempVo;

@Repository
public class TempDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(TempVo vo) throws Exception {
		int result = -1;
		result = sqlSession.insert("temp.insertId", vo);
		
		return result;
	}

	public int update(TempVo vo) throws Exception {
		return sqlSession.update("temp.updateId", vo);
	}

	public int delete(String id) throws Exception {
		return sqlSession.delete("temp.deleteId", id);
	}
	
	public TempVo selectOne(String id) throws Exception {
		return sqlSession.selectOne("temp.selectOneId", id);
	}
	
	public List<TempVo> selectList() throws Exception {
		return sqlSession.selectList("temp.selectListId");
	}

}
