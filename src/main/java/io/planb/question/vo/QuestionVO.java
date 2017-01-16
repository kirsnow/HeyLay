package io.planb.question.vo;

public class QuestionVO {
	private int no;
	private String email;
	private String title;
	private String userInput;
	private String qType;
	private String answer;
	private String regDate;
	
	public QuestionVO() {}

	public QuestionVO(int no, String email, String title, String userInput, String qType, String answer, String regDate) {
		super();
		this.no = no;
		this.email = email;
		this.title = title;
		this.userInput = userInput;
		this.qType = qType;
		this.answer = answer;
		this.regDate = regDate;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserInput() {
		return userInput;
	}

	public void setUserInput(String userInput) {
		this.userInput = userInput;
	}

	public String getQType() {
		return qType;
	}

	public void setQType(String qType) {
		this.qType = qType;
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
		return "QuestionVO [no=" + no + ", email=" + email + ", title=" + title + ", userInput=" + userInput
				+ ", qType=" + qType + ", answer=" + answer + ", regDate=" + regDate + "]";
	}
}
