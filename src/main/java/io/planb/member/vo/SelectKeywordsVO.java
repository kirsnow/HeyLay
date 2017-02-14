package io.planb.member.vo;

public class SelectKeywordVO {

	private int no;
	private String keyword;
	private String regDate;
	private int memberNo;
	
	
	public SelectKeywordVO() {}
	

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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "SelectKeywordVO [no=" + no + ", keyword=" + keyword + ", regDate=" + regDate + ", memberNo=" + memberNo
				+ "]";
	}
	
}
