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

	private String keyword;
	private String searchType;
	
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
	
	
	

}
