package io.planb.statics.vo;

public class StaticsVO {
	private String column;
	private int cnt;
	private String data;
	
	public StaticsVO() {}

	public StaticsVO(String column, int cnt, String data) {
		super();
		this.column = column;
		this.cnt = cnt;
		this.data = data;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "StatisticVO [column=" + column + ", cnt=" + cnt + ", data=" + data + "]";
	}
	
}
