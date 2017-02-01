package io.planb.contents.vo;

public class SavedHeaderVO {
	
	private String regDate;
	private String daysAgo;
	private String source;
	private String category;
	private String directory;
	private int cnt;
	
	public SavedHeaderVO() {
		super();
	}
	public SavedHeaderVO(String regDate, String daysAgo, String source, String category, String directory, int cnt) {
		super();
		this.regDate = regDate;
		this.daysAgo = daysAgo;
		this.source = source;
		this.category = category;
		this.directory = directory;
		this.cnt = cnt;
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
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDirectory() {
		return directory;
	}
	public void setDirectory(String directory) {
		this.directory = directory;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "SavedHeaderVO [regDate=" + regDate + ", daysAgo=" + daysAgo + ", source=" + source + ", category="
				+ category + ", directory=" + directory + ", cnt=" + cnt + "]";
	}
}
