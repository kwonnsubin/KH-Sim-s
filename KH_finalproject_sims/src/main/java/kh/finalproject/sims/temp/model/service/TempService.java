package kh.finalproject.sims.temp.model.service;

import java.util.List;

import kh.finalproject.sims.temp.model.vo.TempVo;

public interface TempService {
	
public int insert(TempVo vo) throws Exception;
	
	public int update(TempVo vo) throws Exception;

	public int delete(String id) throws Exception;
	
	public TempVo selectOne(String id) throws Exception;
	
	public List<TempVo> selectList() throws Exception;

}
