package io.planb.keywords.vo;

import java.sql.Date;

public class KeywordsVO {
	private int no;
	private String keyword;
	private Date regDate;
	private String daysAgo;
	private String status;
	private int memberNo;
	private int cnt;
	
	public KeywordsVO() {}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public String getDaysAgo() {
		return daysAgo;
	}
	
	public void setDaysAgo(String daysAgo) {
		this.daysAgo = daysAgo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "KeywordsVO [no=" + no + ", keyword=" + keyword + ", regDate=" + regDate + ", daysAgo=" + daysAgo
				+ ", status=" + status + ", memberNo=" + memberNo + ", cnt=" + cnt + "]";
	}
}
