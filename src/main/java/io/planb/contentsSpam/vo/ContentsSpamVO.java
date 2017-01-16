package io.planb.contentsSpam.vo;

public class ContentsSpamVO {
	private int no;
	private String email;
	private int contentsNo;
	private String selected;
	private String userInput;
	private String regDate;
	private int reportCnt;
	private String type;
	private String reported;
	
	public ContentsSpamVO() {}

	public ContentsSpamVO(int no, String email, int contentsNo, String selected, String userInput, String regDate, int reportCnt, String type, String reported) {
		super();
		this.no = no;
		this.email = email;
		this.contentsNo = contentsNo;
		this.selected = selected;
		this.userInput = userInput;
		this.regDate = regDate;
		this.reportCnt = reportCnt;
		this.type = type;
		this.reported = reported;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getContentsNo() {
		return contentsNo;
	}

	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}

	public String getSelected() {
		return selected;
	}

	public void setSelected(String selected) {
		this.selected = selected;
	}

	public String getUserInput() {
		return userInput;
	}

	public void setUserInput(String userInput) {
		this.userInput = userInput;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReported() {
		return reported;
	}

	public void setReported(String reported) {
		this.reported = reported;
	}

	@Override
	public String toString() {
		return "ContentsSpamVO [no=" + no + ", email=" + email + ", contentsNo=" + contentsNo + ", selected="
				+ selected + ", userInput=" + userInput + ", regDate=" + regDate + "reportCnt=" + reportCnt 
				+ ", type=" + type + "reported=" + reported + "]";
	}
}
