package io.planb.bugAttach.vo;

public class BugAttachVO {
	private int no;
	private int bugNo;
	private String oriName;
	private String savedName;
	private int fileSize;

	public BugAttachVO() {}

	public BugAttachVO(int no, int bugNo, String oriName, String savedName, int fileSize) {
		super();
		this.no = no;
		this.bugNo = bugNo;
		this.oriName = oriName;
		this.savedName = savedName;
		this.fileSize = fileSize;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBugNo() {
		return bugNo;
	}

	public void setBugNo(int bugNo) {
		this.bugNo = bugNo;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSavedName() {
		return savedName;
	}

	public void setSavedName(String savedName) {
		this.savedName = savedName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "ReportAttach [no=" + no + ", bugNo=" + bugNo + ", oriName=" + oriName + ", savedName="
				+ savedName + ", fileSize=" + fileSize + "]";
	}
}
