package io.planb.contents.vo;

import java.util.Date;

public class ContentsVO {
	
	/* about Contents */
	// Q_CONTENTS
	private int contentsNo;
	private String title;
	private String summary;
	private String url;
	
	private Date scrapedDate;
	private String scrapedDaysAgo;
	
	private String language;
	private char ban;
	
	/* additional informations */
	private int viewCnt;		// Q_CONTENTS
	private int likeCnt;		// Q_LIKE
	
	// Q_SOURCE
	private int sourceNo;
	private String sourceName;
	private String sourceUrl;
	private String sourceDomain;
	private String sourceImg;
	
	// Q_DATA_TYPE
	private int dataTypeNo;
	private String dataTypeName;
	private String dataTypeNameEng;
	private String dataTypeNameFun;
	
	// Q_CATEGORY
	private int categoryNo;
	private String categoryName;
	
	// Q_IMAGE
	private int imgNo;
	private String imgUrl;
	private String imgAlt;
	
	
	/* about Saved contents */
	// Q_CONTENTS_SAVED
	private int memberNo;
	private int savedNo;
	private int savedCnt;
	private Date savedDate;
	private String savedDaysAgo;
	
	// Q_DIRECTORY
	private int directoryNo;
	private String directoryName;
	private Date directoryDate;
	private String directoryDaysAgo;
	
	private String keyword;
	private int limit;
	
	
	public ContentsVO() {
		super();
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
	public Date getScrapedDate() {
		return scrapedDate;
	}
	public void setScrapedDate(Date scrapedDate) {
		this.scrapedDate = scrapedDate;
	}
	public String getScrapedDaysAgo() {
		return scrapedDaysAgo;
	}
	public void setScrapedDaysAgo(String scrapedDaysAgo) {
		this.scrapedDaysAgo = scrapedDaysAgo;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public char getBan() {
		return ban;
	}
	public void setBan(char ban) {
		this.ban = ban;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
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
	public String getSourceDomain() {
		return sourceDomain;
	}
	public void setSourceDomain(String sourceDomain) {
		this.sourceDomain = sourceDomain;
	}
	public String getSourceImg() {
		return sourceImg;
	}
	public void setSourceImg(String sourceImg) {
		this.sourceImg = sourceImg;
	}
	public int getDataTypeNo() {
		return dataTypeNo;
	}
	public void setDataTypeNo(int dataTypeNo) {
		this.dataTypeNo = dataTypeNo;
	}
	public String getDataTypeName() {
		return dataTypeName;
	}
	public void setDataTypeName(String dataTypeName) {
		this.dataTypeName = dataTypeName;
	}
	public String getDataTypeNameEng() {
		return dataTypeNameEng;
	}
	public void setDataTypeNameEng(String dataTypeNameEng) {
		this.dataTypeNameEng = dataTypeNameEng;
	}
	public String getDataTypeNameFun() {
		return dataTypeNameFun;
	}
	public void setDataTypeNameFun(String dataTypeNameFun) {
		this.dataTypeNameFun = dataTypeNameFun;
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
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getImgAlt() {
		return imgAlt;
	}
	public void setImgAlt(String imgAlt) {
		this.imgAlt = imgAlt;
	}
	
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getSavedNo() {
		return savedNo;
	}
	public void setSavedNo(int savedNo) {
		this.savedNo = savedNo;
	}
	public int getSavedCnt() {
		return savedCnt;
	}
	public void setSavedCnt(int savedCnt) {
		this.savedCnt = savedCnt;
	}
	public Date getSavedDate() {
		return savedDate;
	}
	public void setSavedDate(Date savedDate) {
		this.savedDate = savedDate;
	}
	public String getSavedDaysAgo() {
		return savedDaysAgo;
	}
	public void setSavedDaysAgo(String savedDaysAgo) {
		this.savedDaysAgo = savedDaysAgo;
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
	public Date getDirectoryDate() {
		return directoryDate;
	}
	public void setDirectoryDate(Date directoryDate) {
		this.directoryDate = directoryDate;
	}
	public String getDirectoryDaysAgo() {
		return directoryDaysAgo;
	}
	public void setDirectoryDaysAgo(String directoryDaysAgo) {
		this.directoryDaysAgo = directoryDaysAgo;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

}