package io.planb.keywords.vo;

public class KeywordsVO {
	private int no;
	private String keyword;
	private String regDate;
	private String status;
	private String memberNo;
	
	public KeywordsVO() {}

	public KeywordsVO(int no, String keyword, String regDate, String status, String memberNo) {
		super();
		this.no = no;
		this.keyword = keyword;
		this.regDate = regDate;
		this.status = status;
		this.memberNo = memberNo;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "KeywordsVO [no=" + no + ", keyword=" + keyword + ", regDate=" + regDate + ", status=" + status
				+ ", memberNo=" + memberNo + "]";
	}
}
