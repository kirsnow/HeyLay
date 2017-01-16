package io.planb.list.vo;

public class ListVO {

	private int no;
	private String category;
	private String name;
	private String url;
	private int dataType;
	private String logoImg;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
		return "ListVO [no=" + no + ", category=" + category + ", name=" + name + ", url=" + url + ", dataType="
				+ dataType + ", logoImg=" + logoImg + "]";
	}
	
}
