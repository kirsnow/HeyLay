package io.planb.contents.vo;

import java.util.Date;

public class DrawerHeaderVO {
	
	private int memberNo;
	private int cnt;
	private String type;
	
	// Q_CONTENTS
	private Date scrapedDate;
	private String scrapedDaysAgo;
	
	// Q_CONTENTS_SAVED
	private Date savedDate;
	private String savedDaysAgo;
	
	// Q_DIRECTORY
	private int directoryNo;
	private String directoryName;
	
	// Q_SOURCE
	private int sourceNo;
	private String sourceName;
	
	// Q_CATEGORY
	private int categoryNo;
	private String categoryName;
	
	// Q_DATA_TYPE
	private int dataTypeNo;
	private String dataTypeName;
	
	
	public DrawerHeaderVO() {
		super();
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
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

	
}
