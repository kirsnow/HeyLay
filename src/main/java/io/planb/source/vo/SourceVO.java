package io.planb.source.vo;

public class SourceVO {
	private int no;
	private String name;
	private String url;
	private int dataType;
	private String logoImg;
	
	public SourceVO() {}

	public SourceVO(int no, String name, String url, int dataType, String logoImg) {
		super();
		this.no = no;
		this.name = name;
		this.url = url;
		this.dataType = dataType;
		this.logoImg = logoImg;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getDataType() {
		return dataType;
	}

	public void setDataType(int dataType) {
		this.dataType = dataType;
	}

	public String getLogoImg() {
		return logoImg;
	}

	public void setLogoImg(String logoImg) {
		this.logoImg = logoImg;
	}

	@Override
	public String toString() {
		return "SourceVO [no=" + no + ", name=" + name + ", url=" + url + ", dataType=" + dataType + ", logoImg="
				+ logoImg + "]";
	}
}
