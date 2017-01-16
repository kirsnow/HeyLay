package io.planb.contents.vo;

public class SavedHeaderVO {
	
	private String regDate;
	private String source;
	private String category;
	private String directory;
	private int cnt;
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
		return "SavedDateVO [regDate=" + regDate + ", source=" + source + ", category=" + category + ", directory="
				+ directory + ", cnt=" + cnt + "]";
	}
	
}
