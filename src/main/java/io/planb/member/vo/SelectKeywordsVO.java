package io.planb.member.vo;

public class SelectKeywordsVO {
	private int no;
	private String keyword;
	private int memberNo;
	private String regDate;
	
	public SelectKeywordsVO() {}

	public SelectKeywordsVO(int no, String keyword, int memberNo, String regDate) {
		super();
		this.no = no;
		this.keyword = keyword;
		this.memberNo = memberNo;
		this.regDate = regDate;
	}

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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "SelectKeywordsVO [no=" + no + ", keyword=" + keyword + ", memberNo=" + memberNo + ", regDate=" + regDate
				+ "]";
	}
	
}
