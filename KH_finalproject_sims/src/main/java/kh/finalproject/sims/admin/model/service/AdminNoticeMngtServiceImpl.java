package kh.finalproject.sims.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.common.page.Search;
import kh.finalproject.sims.admin.model.dao.AdminNoticeMngtDao;

@Service
public class AdminNoticeMngtServiceImpl implements AdminNoticeMngtService{

	
	@Autowired
	private AdminNoticeMngtDao dao;
	
	
	    //관리자 공지사항 리스트
		@Override
		public Search selectNoticeList(int pNum, int cnt, String searchOption, String searchBox){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", (pNum - 1) * cnt + 1);
			map.put("end", pNum * cnt);
			map.put("searchOption", searchOption);
			map.put("searchBox", searchBox);
			List<AdminNoticeMngtVo> dataList = dao.selectNoticeList(map);
			int totalRowCount = dao.selectNoticeListCnt(map);
			int mod = totalRowCount % cnt == 0 ? 0 : 1;
			int pageCount = (totalRowCount / cnt) + mod;
			Search search = new Search(dataList, pNum, pageCount, cnt, 5, totalRowCount,searchOption,searchBox, null);
			return search;
		}
		
		//관리자 공지사항 상세
		@Override
		public AdminNoticeMngtVo selectNoticeDetail(int ntcNo){
			return dao.selectNoticeDetail(ntcNo);
		}
		
		//관리자 공지사항 글 작성
		@Override
		public int insertNoticeWrite(AdminNoticeMngtVo vo){
			return dao.insertNoticeWrite(vo);
		}

		//관리자 공지사항 글 삭제
		@Override
		public int deleteNotice(int ntcNo) {
			return dao.deleteNotice(ntcNo);
		}
	
		//관리자 공지사항 글 수정 저장
		@Override
		public int saveNoticeModify(AdminNoticeMngtVo vo){
			return dao.saveNoticeModify(vo);
		}
}
