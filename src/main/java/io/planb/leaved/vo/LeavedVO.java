package io.planb.leaved.vo;

public class LeavedVO {
	private int memberNo;
	private String reasonSelect;
	private String reasonInput;
	private String regDate;
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getReasonSelect() {
		return reasonSelect;
	}
	public void setReasonSelect(String reasonSelect) {
		this.reasonSelect = reasonSelect;
	}
	public String getReasonInput() {
		return reasonInput;
	}
	public void setReasonInput(String reasonInput) {
		this.reasonInput = reasonInput;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "LeavedVO [memberNo=" + memberNo + ", reasonSelect=" + reasonSelect + ", reasonInput=" + reasonInput
				+ ", regDate=" + regDate + "]";
	}
}
