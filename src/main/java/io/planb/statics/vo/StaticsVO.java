package io.planb.statics.vo;

public class StaticsVO {
	private String columnName;
	private int cnt;
	private String data;
	
	public StaticsVO() {}

	public StaticsVO(String columnName, int cnt, String data) {
		super();
		this.columnName = columnName;
		this.cnt = cnt;
		this.data = data;
	}

	public String getColumn() {
		return columnName;
	}

	public void setColumn(String columnName) {
		this.columnName = columnName;
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
		return "StatisticVO [columnName=" + columnName + ", cnt=" + cnt + ", data=" + data + "]";
	}
	
}
