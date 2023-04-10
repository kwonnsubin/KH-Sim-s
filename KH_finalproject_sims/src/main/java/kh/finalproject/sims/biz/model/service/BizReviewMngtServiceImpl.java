package kh.finalproject.sims.biz.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizReviewMngtDao;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.common.page.Paging;

@Service
public class BizReviewMngtServiceImpl implements BizReviewMngtService {

	@Autowired
	private BizReviewMngtDao dao;
	
	@Override
	public int getReviewListCount(String bizid) {
		return dao.getReviewListCount(bizid);
	}

	@Override
	public Paging getPage(String bizid, int pNum, int cnt) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		
		int totalRowCount = dao.getReviewListCount(bizid);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizReviewMngtVo>data = dao.selectPage(map);
		Paging paging = new Paging(data, pNum, pageCount, cnt, 5);
		
		return paging;
	}

	@Override
	public int reportReview(BizReviewMngtVo vo) {
		return dao.reportReview(vo);
	}

	@Override
	public int cancleReport(int reviewNo) {
		return dao.cancleReport(reviewNo);
	}

}
