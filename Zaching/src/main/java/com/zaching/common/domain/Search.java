package com.zaching.common.domain;

public class Search {

	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	
	private int searchsorting;
	
	/* Category ±¸ºÐ */
	private String category;
	
	public Search() {
		// TODO Auto-generated constructor stub
	}
	
	

	public int getSearchsorting() {
		return searchsorting;
	}



	public void setSearchsorting(int searchsorting) {
		this.searchsorting = searchsorting;
	}



	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}

	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", pageSize=" + pageSize + ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum
				+ ", category=" + category + "]";
	}

}
