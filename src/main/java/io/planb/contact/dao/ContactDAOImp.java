package io.planb.contact.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.bugAttach.vo.BugAttachVO;
import io.planb.contact.vo.ReportVO;
import io.planb.question.vo.QuestionVO;


@Repository
public class ContactDAOImp {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void sendQuestion(QuestionVO questionVO) {
		sqlSessionTemplate.insert("io.planb.contact.dao.contactDAO.sendQuestion", questionVO);
	}

	public void sendPartnership(QuestionVO questionVO) {
		System.out.println(questionVO);
		sqlSessionTemplate.insert("io.planb.contact.dao.contactDAO.sendPartnership", questionVO);
	}
	
	public void sendBugReport(ReportVO reportVO) {
		System.out.println(reportVO);
		sqlSessionTemplate.insert("io.planb.contact.dao.contactDAO.sendBugReport", reportVO);
	}

	public void sendSpamContents(ReportVO reportVO) {
		int no = reportVO.getContentsNo();
		sqlSessionTemplate.insert("io.planb.contact.dao.contactDAO.sendSpamContents", reportVO);
	}

	public void sendSpamMemo(ReportVO reportVO) {
		sqlSessionTemplate.insert("io.planb.contact.dao.contactDAO.sendSpamMemo", reportVO);
	}

	public void sendBugReportAttach(BugAttachVO bugAttach) {
		sqlSessionTemplate.insert("io.planb.contact.dao.contactDAO.sendBugReportAttach", bugAttach);
	}

}
