package io.planb.memo.vo;

public class MemoVO {
	private int no;
	private String message;
	private String regDate;
	private int reportCnt;
	private int memberNo;
	private int contentsNo;
	
	public MemoVO() {}

	public MemoVO(int no, String message, String regDate, int reportCnt, int memberNo, int contentsNo) {
		super();
		this.no = no;
		this.message = message;
		this.regDate = regDate;
		this.reportCnt = reportCnt;
		this.memberNo = memberNo;
		this.contentsNo = contentsNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getContentsNo() {
		return contentsNo;
	}

	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}

	@Override
	public String toString() {
		return "MemoVO [no=" + no + ", message=" + message + ", regDate=" + regDate + ", reportCnt=" + reportCnt
				+ ", memberNo=" + memberNo + ", contentsNo=" + contentsNo + "]";
	}
}
