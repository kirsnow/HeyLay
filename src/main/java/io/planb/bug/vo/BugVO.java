package io.planb.bug.vo;

public class BugVO {
	private int no;
	private String email;
	private String url;
	private String userInput;
	private String regDate;
	private String device;
	private String os;
	private String cpu;
	private String ram;

	public BugVO() {}

	public BugVO(int no, String email, String url, String userInput, String regDate, String device, String os,
			String cpu, String ram) {
		super();
		this.no = no;
		this.email = email;
		this.url = url;
		this.userInput = userInput;
		this.regDate = regDate;
		this.device = device;
		this.os = os;
		this.cpu = cpu;
		this.ram = ram;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUserInput() {
		return userInput;
	}

	public void setUserInput(String userInput) {
		this.userInput = userInput;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	@Override
	public String toString() {
		return "ReportVO [no=" + no + ", email=" + email + ", url=" + url + ", userInput=" + userInput + ", regDate="
				+ regDate + ", device=" + device + ", os=" + os + ", cpu=" + cpu + ", ram=" + ram + "]";
	}
}
