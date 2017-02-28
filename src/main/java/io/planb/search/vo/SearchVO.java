package io.planb.search.vo;

import java.util.List;

import io.planb.contents.vo.ContentsVO;

public class SearchVO {
	private String query;
	private List<QueryVO> queryList;
	private char keywordType;
	private int userNo;
	private int total;
	private double maxScore;
	private List<ContentsVO> cards;
	
	public SearchVO() {
		super();
	}

	public SearchVO(String query, List<QueryVO> queryList, char keywordType, int userNo, int total, double maxScore,
			List<ContentsVO> cards) {
		super();
		this.query = query;
		this.queryList = queryList;
		this.keywordType = keywordType;
		this.userNo = userNo;
		this.total = total;
		this.maxScore = maxScore;
		this.cards = cards;
	}

	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public List<QueryVO> getQueryList() {
		return queryList;
	}
	public void setQueryList(List<QueryVO> queryList) {
		this.queryList = queryList;
	}
	public char getKeywordType() {
		return keywordType;
	}
	public void setKeywordType(char keywordType) {
		this.keywordType = keywordType;
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
	public List<ContentsVO> getCards() {
		return cards;
	}
	public void setCards(List<ContentsVO> contents) {
		this.cards = contents;
	}

	@Override
	public String toString() {
		return "SearchVO [query=" + query + ", queryList=" + queryList + ", keywordType=" + keywordType + ", userNo="
				+ userNo + ", total=" + total + ", maxScore=" + maxScore + ", cards=" + cards + "]";
	}

}
