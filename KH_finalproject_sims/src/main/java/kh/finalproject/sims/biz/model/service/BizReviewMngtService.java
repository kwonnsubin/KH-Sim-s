package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.common.page.Paging;

public interface BizReviewMngtService {
	public int getReviewListCount(String bizid) throws Exception;
	public Paging getPage(String bizid, int pNum, int cnt) throws Exception;
	public int reportReview(BizReviewMngtVo vo) throws Exception;
	public int cancleReport(int reviewNo) throws Exception;
	public BizReviewMngtVo selectReviewDetail(int reviewNo) throws Exception;
	
	// 메인 통신사 페이지 리뷰
	public List<BizReviewMngtVo> selectBizReviewList(String bizId) throws Exception;
	
	//신고처리상태에 따른 조회
	public Paging selectByReportStatus(String bizid, int pNum, int cnt, int reportStatus) throws Exception;
	public int selectByReportStatusCnt(String bizid, int reportStatus) throws Exception;
}
