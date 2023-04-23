package kh.finalproject.sims.common.page;

public class Search extends Paging {

	public Search(Object page, int currentPage, int lastPage, int pageLimit, int listLimit, String keyword) {
		super(page, currentPage, lastPage, pageLimit, listLimit);
		this.keyword = keyword;
	}
	
	public Search(Object page, int currentPage, int lastPage, int pageLimit, int listLimit,String searchType, String keyword) {
		super(page, currentPage, lastPage, pageLimit, listLimit);
		this.searchType = searchType;
		this.keyword = keyword;
	}
	
	/* 관리자용 조회 조건 */
	public Search(Object page, int currentPage, int lastPage, int pageLimit, int listLimit, int totalRowCount, String searchOption, String searchRadioVal, String searchBox) {
		super(page, currentPage, lastPage, pageLimit, listLimit);
		this.setSearchOption(searchOption);
		this.setSearchRadioVal(searchRadioVal);
		this.setSearchBox(searchBox);
		this.setTotalRowCount(totalRowCount);
	}

	private String keyword;
	private String searchType;
	
	/* 관리자용 조회 변수명 */
	private String searchOption;
	private String searchRadioVal;
	private String searchBox;
	private int totalRowCount;
	
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getSearchRadioVal() {
		return searchRadioVal;
	}

	public void setSearchRadioVal(String searchRadioVal) {
		this.searchRadioVal = searchRadioVal;
	}

	public String getSearchBox() {
		return searchBox;
	}

	public void setSearchBox(String searchBox) {
		this.searchBox = searchBox;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
	
	
	

}
