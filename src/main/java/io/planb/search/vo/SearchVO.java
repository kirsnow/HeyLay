package io.planb.search.vo;

import java.util.List;

import io.planb.contents.vo.ContentsVO;

public class SearchVO {
	private String query;
	private int userNo;
	private int total;
	private double maxScore;
	private List<ContentsVO> contents;
	
	public SearchVO() {
		super();
	}
	
	public SearchVO(String query, int userNo, int total, double maxScore, List<ContentsVO> contents) {
		super();
		this.query = query;
		this.userNo = userNo;
		this.total = total;
		this.maxScore = maxScore;
		this.contents = contents;
	}

	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public double getMaxScore() {
		return maxScore;
	}
	public void setMaxScore(double maxScore) {
		this.maxScore = maxScore;
	}
	public List<ContentsVO> getContents() {
		return contents;
	}
	public void setContents(List<ContentsVO> contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "SearchVO [query=" + query + ", userNo=" + userNo + ", total=" + total + ", maxScore=" + maxScore
				+ ", contents=" + contents + "]";
	}

}
