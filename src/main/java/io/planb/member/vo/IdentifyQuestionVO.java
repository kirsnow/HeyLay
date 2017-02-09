package io.planb.member.vo;

public class IdentifyQuestionVO {
	private int no;
	private String question;
	
	public IdentifyQuestionVO() {}

	public IdentifyQuestionVO(int no, String question) {
		super();
		this.no = no;
		this.question = question;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Override
	public String toString() {
		return "IdentifyQuestionVO [no=" + no + ", question=" + question + "]";
	}
	
}
