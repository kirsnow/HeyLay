package io.planb.contact.vo;

public class ReportVO {
	private int no;
	private String email;
	private int contentsNo;
	private int memoNo;
	private String selected;
	private String userInput;
	private String regDate;
	private String url;
	private String browser;
	private String os;
	
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
	public int getMemoNo() {
		return memoNo;
	}
	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	@Override
	public String toString() {
		return "ReportVO [no=" + no + ", email=" + email + ", contentsNo=" + contentsNo + ", memoNo=" + memoNo
				+ ", selected=" + selected + ", userInput=" + userInput + ", regDate=" + regDate + ", url=" + url
				+ ", browser=" + browser + ", os=" + os + "]";
	}
	
}
