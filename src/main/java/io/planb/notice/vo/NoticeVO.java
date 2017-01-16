package io.planb.notice.vo;

public class NoticeVO {
	private int no;
	private String title;
	private String contents;
	private String noticeType;
	private int viewCnt;
	private String regDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	
	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", title=" + title + ", contents=" + contents + ", noticeType=" + noticeType
				+ ", viewCnt=" + viewCnt + ", regDate=" + regDate + "]";
	}
	
}
