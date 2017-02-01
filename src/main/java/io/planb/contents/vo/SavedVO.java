package io.planb.contents.vo;

public class SavedVO {
	
	//test
	private int no;
	private int memberNo;
	private String regDate;
	private String daysAgo;
	
	// Q_CONTENTS
	private int contentsNo;
	private String title;
	private String summary;
	private String url;
	private String imgUrl;
	private int viewCnt;
	
	// Q_DIRECTORY
	private int directoryNo;
	private String directoryName;
	
	//Q_SOURCE
	private int sourceNo;
	private String sourceName;
	private String sourceUrl;
	private String logoImg;

	//Q_CATEGORY
	private int categoryNo;
	private String categoryName;

	//Q_DATA_TYPE
	private int dataNo;
	private String dataType;
	
	public SavedVO() {
		super();
	}
	
	public SavedVO(int no, int memberNo, String regDate, String daysAgo, int contentsNo, String title, String summary,
			String url, String imgUrl, int viewCnt, int directoryNo, String directoryName, int sourceNo,
			String sourceName, String sourceUrl, String logoImg, int categoryNo, String categoryName, int dataNo,
			String dataType) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.regDate = regDate;
		this.daysAgo = daysAgo;
		this.contentsNo = contentsNo;
		this.title = title;
		this.summary = summary;
		this.url = url;
		this.imgUrl = imgUrl;
		this.viewCnt = viewCnt;
		this.directoryNo = directoryNo;
		this.directoryName = directoryName;
		this.sourceNo = sourceNo;
		this.sourceName = sourceName;
		this.sourceUrl = sourceUrl;
		this.logoImg = logoImg;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.dataNo = dataNo;
		this.dataType = dataType;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getDaysAgo() {
		return daysAgo;
	}
	public void setDaysAgo(String daysAgo) {
		this.daysAgo = daysAgo;
	}
	public int getContentsNo() {
		return contentsNo;
	}
	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getDirectoryNo() {
		return directoryNo;
	}
	public void setDirectoryNo(int directoryNo) {
		this.directoryNo = directoryNo;
	}
	public String getDirectoryName() {
		return directoryName;
	}
	public void setDirectoryName(String directoryName) {
		this.directoryName = directoryName;
	}
	public int getSourceNo() {
		return sourceNo;
	}
	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}
	public String getSourceName() {
		return sourceName;
	}
	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}
	public String getSourceUrl() {
		return sourceUrl;
	}
	public void setSourceUrl(String sourceUrl) {
		this.sourceUrl = sourceUrl;
	}
	public String getLogoImg() {
		return logoImg;
	}
	public void setLogoImg(String logoImg) {
		this.logoImg = logoImg;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public int getDataNo() {
		return dataNo;
	}
	public void setDataNo(int dataNo) {
		this.dataNo = dataNo;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	
	@Override
	public String toString() {
		return "SavedVO [no=" + no + ", memberNo=" + memberNo + ", regDate=" + regDate + ", daysAgo=" + daysAgo
				+ ", contentsNo=" + contentsNo + ", title=" + title + ", summary=" + summary + ", url=" + url
				+ ", imgUrl=" + imgUrl + ", viewCnt=" + viewCnt + ", directoryNo=" + directoryNo + ", directoryName="
				+ directoryName + ", sourceNo=" + sourceNo + ", sourceName=" + sourceName + ", sourceUrl=" + sourceUrl
				+ ", logoImg=" + logoImg + ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", dataNo="
				+ dataNo + ", dataType=" + dataType + "]";
	}
}