package io.planb.directory.vo;

public class DirectoryVO {
	private int no;
	private String name;
	private String regDate;
	private int memberNo;
	
	public DirectoryVO() {}

	public DirectoryVO(int no, String name, String regDate, int memberNo) {
		super();
		this.no = no;
		this.name = name;
		this.regDate = regDate;
		this.memberNo = memberNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		return "DirectoryVO [no=" + no + ", name=" + name + ", regDate=" + regDate + ", memberNo=" + memberNo + "]";
	}

}
