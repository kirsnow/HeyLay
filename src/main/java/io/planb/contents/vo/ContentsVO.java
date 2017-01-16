package io.planb.contents.vo;

public class ContentsVO {
	private int no;
	private String title;
	private String summary;
	private int reportCnt;
	private int sourceNo;
	private int categoryNo;
	private int saveCnt;
	private int likeCnt;
	
	public ContentsVO() {}

	public ContentsVO(int no, String title, String summary, int viewCnt, int reportCnt, int sourceNo,
			int categoryNo, int saveCnt, int likeCnt) {
		super();
		this.no = no;
		this.title = title;
		this.summary = summary;
		this.reportCnt = reportCnt;
		this.sourceNo = sourceNo;
		this.categoryNo = categoryNo;
		this.saveCnt = saveCnt;
		this.likeCnt = likeCnt;
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

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public int getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getSaveCnt() {
		return saveCnt;
	}

	public void setSaveCnt(int saveCnt) {
		this.saveCnt = saveCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	@Override
	public String toString() {
		return "ContentsVO [no=" + no + ", title=" + title + ", summary=" + summary + ", reportCnt=" + reportCnt 
				+ ", sourceNo=" + sourceNo + ", categoryNo=" + categoryNo + ", saveCnt=" + saveCnt + ", likeCnt=" + likeCnt + "]";
	}
}
