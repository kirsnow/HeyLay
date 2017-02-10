package io.planb.contents.vo;

public class DataTypeVO {
	private int no;
	private String dataType;
	private String dataTypeEng;
	private String funName;
	
	public DataTypeVO() {}

	public DataTypeVO(int no, String dataType, String dataTypeEng, String funName) {
		super();
		this.no = no;
		this.dataType = dataType;
		this.dataTypeEng = dataTypeEng;
		this.funName = funName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getDataTypeEng() {
		return dataTypeEng;
	}

	public void setDataTypeEng(String dataTypeEng) {
		this.dataTypeEng = dataTypeEng;
	}

	public String getFunName() {
		return funName;
	}

	public void setFunName(String funName) {
		this.funName = funName;
	}

	@Override
	public String toString() {
		return "DataTypeVO [no=" + no + ", dataType=" + dataType + ", dataTypeEng=" + dataTypeEng + ", funName="
				+ funName + "]";
	}
	
}
