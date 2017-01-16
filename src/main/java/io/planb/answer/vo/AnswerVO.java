package io.planb.answer.vo;

public class AnswerVO {
	private int no;
	private int questionNo;
	private String answer;
	private String regDate;
	
	public AnswerVO() {}

	public AnswerVO(int no, int questionNo, String answer, String regDate) {
		super();
		this.no = no;
		this.questionNo = questionNo;
		this.answer = answer;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "AnswerVO [no=" + no + ", questionNo=" + questionNo + ", answer=" + answer + ", regDate=" + regDate
				+ "]";
	}
}
