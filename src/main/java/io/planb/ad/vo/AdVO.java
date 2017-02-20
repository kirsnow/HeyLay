package io.planb.ad.vo;

public class AdVO implements Cloneable {
	private int no;
	private int location;
	private String code;
	private String siteName;
	
	public AdVO() {}

	public AdVO(int no, int location, String code, String siteName) {
		super();
		this.no = no;
		this.location = location;
		this.code = code;
		this.siteName = siteName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	@Override
	public String toString() {
		return "AdVO [no=" + no + ", location=" + location + ", code=" + code + ", siteName=" + siteName + "]";
	}
	
	public Object clone() throws CloneNotSupportedException {
		AdVO ad = (AdVO) super.clone();
		
		return ad;
	}
}
