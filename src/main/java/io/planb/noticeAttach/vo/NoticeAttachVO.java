package io.planb.noticeAttach.vo;

public class NoticeAttachVO {
	private int no;
	private int noticeNo;
	private String oriName;
	private String savedName;
	private int fileSize;
	
	public NoticeAttachVO() {}

	public NoticeAttachVO(int no, int noticeNo, String oriName, String savedName, int fileSize) {
		super();
		this.no = no;
		this.noticeNo = noticeNo;
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

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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
		return "NoticeAttachVO [no=" + no + ", noticeNo=" + noticeNo + ", oriName=" + oriName + ", savedName="
				+ savedName + ", fileSize=" + fileSize + "]";
	}
}
