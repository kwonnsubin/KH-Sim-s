package kh.finalproject.sims.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminUserMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;
import kh.finalproject.sims.common.page.Search;

@Service
public class AdminUserMngtServiceImpl implements AdminUserMngtService{
	
	@Autowired
	private AdminUserMngtDao dao;
	
		//관리자의 사용자 관리 리스트
		@Override
		public Search selectUserList(int pNum, int cnt, String searchUserId, String searchUserName, String searchRadioVal) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", (pNum - 1) * cnt + 1);
			map.put("end", pNum * cnt);
			map.put("searchUserId", searchUserId);
			map.put("searchUserName", searchUserName);
			map.put("searchRadioVal", searchRadioVal);
			List<AdminUserMngtVo> dataList = dao.selectUserList(map);
			int totalRowCount = dao.selectUserListCnt(map);
			int mod = totalRowCount % cnt == 0 ? 0 : 1;
			int pageCount = (totalRowCount / cnt) + mod;
			Search search = new Search(dataList, pNum, pageCount, cnt, 5, totalRowCount, searchUserId, searchUserName, searchRadioVal);
			return search;
		}

		//관리자의 사용자 관리 상세
		@Override
		public AdminUserMngtVo selectUserDetail(String userId) {
			return dao.selectUserDetail(userId);
		}

		//관리자의 사용자 관리 수정 저장
		@Override
		public int saveUserModify(AdminUserMngtVo vo) {
			return dao.saveUserModify(vo);
		}
	
		@Override
		//가입한 요금제 개수
		public int selectMyPlanListCountAdmin(String userId) {
			return dao.selectMyPlanListCountAdmin(userId);
		}

		@Override
		//리뷰를 개수
		public int selectOrderListCountAdmin(String userId) {
			return dao.selectOrderListCountAdmin(userId);
		}

		//사용자가 신청한 요금제 리스트 ajax
		public List<AdminBizMngtVo> selectUserApplyPlanAjax(String userId) {
			return dao.selectUserApplyPlanAjax(userId);
		}
}
