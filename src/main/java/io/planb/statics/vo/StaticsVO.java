package io.planb.statics.vo;

public class StaticsVO {
	private int no;
	private String columnName;
	private int cnt;
	private String data;
	
	public StaticsVO() {}

	public StaticsVO(int no, String columnName, int cnt, String data) {
		super();
		this.no = no;
		this.columnName = columnName;
		this.cnt = cnt;
		this.data = data;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
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

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "StatisticVO [no=" + no + ", columnName=" + columnName + ", cnt=" + cnt + ", data=" + data + "]";
	}
	
}
