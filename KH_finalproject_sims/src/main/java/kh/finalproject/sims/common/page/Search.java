package kh.finalproject.sims.common.page;

public class Search extends Paging {

	public Search(Object page, int currentPage, int lastPage, int pageLimit, int listLimit, String keyword) {
		super(page, currentPage, lastPage, pageLimit, listLimit);
		this.keyword = keyword;
	}

	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	

}
