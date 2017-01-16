package io.planb.faq.vo;

public class FaqVO {
	private int no;
	private String title;
	private String content;
	private String regDate;
	
	public FaqVO() {}

	public FaqVO(int no, String title, String content, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "FaqVO [no=" + no + ", title=" + title + ", content=" + content + ", regDate=" + regDate + "]";
	}
}
