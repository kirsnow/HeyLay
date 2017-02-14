package io.planb.contents.vo;

public class ContentsVO {
	private int contentsNo;
	private int memberNo;
	private String regDate;
	private String daysAgo;
	
	private String title;
	private String summary;
	private String url;
	private String imgUrl;
	private String lastScraped;
	private String ban;
	
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
	
	private int saveCnt;
	private int reportCnt;
	private int likeCnt;
	private int viewCnt;
	
	private int savedNo;
	
	// Q_DIRECTORY
	private int directoryNo;
	private String directoryName;
	

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

	public String getLastScraped() {
		return lastScraped;
	}

	public void setLastScraped(String lastScraped) {
		this.lastScraped = lastScraped;
	}

	public String getBan() {
		return ban;
	}

	public void setBan(String ban) {
		this.ban = ban;
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

	public int getSaveCnt() {
		return saveCnt;
	}

	public void setSaveCnt(int saveCnt) {
		this.saveCnt = saveCnt;
	}

	public int getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getSavedNo() {
		return savedNo;
	}

	public void setSavedNo(int savedNo) {
		this.savedNo = savedNo;
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

}