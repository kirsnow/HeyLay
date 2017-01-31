package io.planb.memo.vo;

public class MemoVO {
	private int no;
	private int contentsNo;
	private String contentsTitle;
	private int memberNo;
	private String firstName;
	private String lastName;
	private String message;
	private String regDate;
	private String ban;
	
	public MemoVO() {
		super();
	}

	public MemoVO(int no, int contentsNo, String contentsTitle, int memberNo, String firstName, String lastName,
			String message, String regDate, String ban) {
		super();
		this.no = no;
		this.contentsNo = contentsNo;
		this.contentsTitle = contentsTitle;
		this.memberNo = memberNo;
		this.firstName = firstName;
		this.lastName = lastName;
		this.message = message;
		this.regDate = regDate;
		this.ban = ban;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getContentsNo() {
		return contentsNo;
	}

	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}

	public String getContentsTitle() {
		return contentsTitle;
	}

	public void setContentsTitle(String contentsTitle) {
		this.contentsTitle = contentsTitle;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public String getBan() {
		return ban;
	}

	public void setBan(String ban) {
		this.ban = ban;
	}

	@Override
	public String toString() {
		return "MemoVO [no=" + no + ", contentsNo=" + contentsNo + ", contentsTitle=" + contentsTitle + ", memberNo="
				+ memberNo + ", firstName=" + firstName + ", lastName=" + lastName + ", message=" + message
				+ ", regDate=" + regDate+ ", ban=" + ban + "]";
	}
	
}
