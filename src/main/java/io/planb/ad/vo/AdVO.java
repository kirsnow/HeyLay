package io.planb.ad.vo;

public class AdVO {
	private int no;
	private String location;
	private String code;
	
	public AdVO() {}

	public AdVO(int no, String location, String code) {
		super();
		this.no = no;
		this.location = location;
		this.code = code;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "AdVO [no=" + no + ", location=" + location + ", code=" + code + "]";
	}
}
