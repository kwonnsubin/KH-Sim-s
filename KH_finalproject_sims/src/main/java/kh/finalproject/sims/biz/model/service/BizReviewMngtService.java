package kh.finalproject.sims.biz.model.service;

import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.common.page.Paging;

public interface BizReviewMngtService {
	public int getReviewListCount(String bizid);
	public Paging getPage(String bizid, int pNum, int cnt);
	public int reportReview(BizReviewMngtVo vo);
	public int cancleReport(int reviewNo);
	public BizReviewMngtVo selectReviewDetail(int reviewNo);
}
