package io.planb.admin.help.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.answer.vo.AnswerVO;
import io.planb.contents.vo.ContentsVO;
import io.planb.contentsSpam.vo.ContentsSpamVO;
import io.planb.faq.vo.FaqVO;
import io.planb.notice.vo.NoticeVO;
import io.planb.noticeAttach.vo.NoticeAttachVO;
import io.planb.question.vo.QuestionVO;

@Repository
public class HelpDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<QuestionVO> selectQuestionList() {
		List<QuestionVO> questionList = sqlSessionTemplate.selectList("io.planb.admin.help.dao.HelpDAO.selectQuestionList");
		
		System.out.println(questionList);
		
		return questionList;
	}

	public int countQuestion() {
		int questionCnt = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.countQuestion");

		return questionCnt;
	}

	public QuestionVO selectQuestionDetail(int no) {
		QuestionVO question = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.selectQuestionDetail", no);
		return question;
	}

	public AnswerVO selectAnswerDetail(int no) {
		AnswerVO answer = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.selectAnswerDetail", no);
		return answer;
	}
	
	public void insertFaq(FaqVO faq) {
		sqlSessionTemplate.insert("io.planb.admin.help.dao.HelpDAO.insertFaq", faq);
	}
	
	public void updateFaq(FaqVO faq) {
		sqlSessionTemplate.update("io.planb.admin.help.dao.HelpDAO.updateFaq", faq);
	}
	
	public void deleteFaq(int no) {
		sqlSessionTemplate.delete("io.planb.admin.help.dao.HelpDAO.deleteFaq", no);
	}
	
	public void insertNotice(NoticeVO notice) {
		sqlSessionTemplate.insert("io.planb.admin.help.dao.HelpDAO.insertNotice", notice);
	}

	public void insertNoticeAttach(NoticeAttachVO noticeAttach) {
		sqlSessionTemplate.insert("io.planb.admin.help.dao.HelpDAO.insertNoticeAttach", noticeAttach);
	}

	public void updateNotice(NoticeVO notice) {
		sqlSessionTemplate.update("io.planb.admin.help.dao.HelpDAO.updateNotice", notice);
	}

	public void updateNoticeAttach(NoticeAttachVO noticeAttach) {
		sqlSessionTemplate.update("io.planb.admin.help.dao.HelpDAO.updateNoticeAttach", noticeAttach);
	}

	public void deleteNotice(int no) {
		sqlSessionTemplate.delete("io.planb.admin.help.dao.HelpDAO.deleteNotice", no);
	}

	public NoticeVO selectNoticeDetail(int no) {
		NoticeVO notice = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.selectNoticeDetail", no);
		return notice;
	}

	public List<ContentsSpamVO> seleteContentsSpamList() {
		List<ContentsSpamVO> contentsSpamList = sqlSessionTemplate.selectList("io.planb.admin.help.dao.HelpDAO.seleteContentsSpamList");

		return contentsSpamList;
	}

	public int countContentsSpam() {
		int spamCnt = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.countContentsSpam");
		
		return spamCnt;
	}

	public List<ContentsSpamVO> seleteMemoSpamList() {
		List<ContentsSpamVO> contentsSpamList = sqlSessionTemplate.selectList("io.planb.admin.help.dao.HelpDAO.seleteMemoSpamList");

		return contentsSpamList;
	}

	public int countMemoSpam() {
		int spamCnt = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.countMemoSpam");

		return spamCnt;
	}

	public void deleteContentsSpam(int no) {
		sqlSessionTemplate.delete("io.planb.admin.help.dao.HelpDAO.deleteContentsSpam", no);
	}

	public void deleteMemoSpam(int no) {
		sqlSessionTemplate.delete("io.planb.admin.help.dao.HelpDAO.deleteMemoSpam", no);
	}

	public ContentsSpamVO selectContentsSpamDetail(int no) {
		ContentsSpamVO spam = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.selectContentsSpamDetail", no);
		
		return spam;
	}

	public ContentsSpamVO selectMemoSpamDetail(int no) {
		ContentsSpamVO spam = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.selectMemoSpamDetail", no);
		
		return spam;
	}

	public List<ContentsSpamVO> seleteSpamContentList() {
		List<ContentsSpamVO> spamList = sqlSessionTemplate.selectList("io.planb.admin.help.dao.HelpDAO.seleteSpamContentList");
		
		return spamList;
	}

	public List<ContentsSpamVO> seleteSpamMemoList() {
		List<ContentsSpamVO> spamList = sqlSessionTemplate.selectList("io.planb.admin.help.dao.HelpDAO.seleteSpamMemoList");
		
		return spamList;
	}

	public int countSpamContent() {
		int spamCnt = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.countSpamContent");
		
		return spamCnt;
	}

	public int countSpamMemo() {
		int spamCnt = sqlSessionTemplate.selectOne("io.planb.admin.help.dao.HelpDAO.countSpamMemo");
		
		return spamCnt;
	}

	public void deleteQna(int no) {
		sqlSessionTemplate.delete("io.planb.admin.help.dao.HelpDAO.deleteQna", no);
	}
}
