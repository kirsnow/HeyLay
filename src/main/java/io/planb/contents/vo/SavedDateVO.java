package io.planb.contents.vo;

public class SavedDateVO {
	
	//test
	private String regDate;
	private int cnt;
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "SavedDateVO [regDate=" + regDate + ", cnt=" + cnt + "]";
	}
	
}
