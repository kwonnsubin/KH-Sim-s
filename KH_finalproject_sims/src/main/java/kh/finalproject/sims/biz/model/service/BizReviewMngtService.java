package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.common.page.Paging;

public interface BizReviewMngtService {
	public int getReviewListCount(String bizid);
	public Paging getPage(String bizid, int pNum, int cnt);
	public int reportReview(BizReviewMngtVo vo);
	public int cancleReport(int reviewNo);
	public BizReviewMngtVo selectReviewDetail(int reviewNo);
	
	// 메인 통신사 페이지 리뷰
	public List<BizReviewMngtVo> selectBizReviewList(String bizId);
}
