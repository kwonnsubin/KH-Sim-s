package kh.finalproject.sims.temp.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.temp.model.dao.TempDao;
import kh.finalproject.sims.temp.model.vo.TempVo;

@Service
public class TempServiceImpl implements TempService {
	
	@Autowired
	private TempDao dao;
	
	@Override
	public int insert(TempVo vo) throws Exception {
		
		return 0;
	}

	@Override
	public int update(TempVo vo) throws Exception {
		
		return 0;
	}

	@Override
	public int delete(String id) throws Exception {
		
		return 0;
	}
	
	@Override
	public TempVo selectOne(String id) throws Exception {
		
		return null;
	}
	
	@Override
	public List<TempVo> selectList() throws Exception {
		
		return dao.selectList();
	}

}
