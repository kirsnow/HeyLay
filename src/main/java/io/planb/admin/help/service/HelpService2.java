package io.planb.admin.help.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import io.planb.admin.help.dao.HelpDAO;
import io.planb.answer.vo.AnswerVO;
import io.planb.faq.vo.FaqVO;
import io.planb.notice.vo.NoticeVO;
import io.planb.noticeAttach.vo.NoticeAttachVO;
import io.planb.question.vo.QuestionVO;

@Service
public class HelpService2 {
	
	@Autowired
	private HelpDAO dao;
	
	@Autowired
	private ServletContext servletContext;

	public List<QuestionVO> selectQuestionList() {
		List<QuestionVO> questionList = dao.selectQuestionList();
		return questionList;
	}

	public QuestionVO selectQuestionDetail(int no) {
		QuestionVO question = dao.selectQuestionDetail(no);
		return question;
	}

	public AnswerVO selectAnswerDetail(int no) {
		AnswerVO answer = dao.selectAnswerDetail(no);
		return answer;
	}
	
	public void insertFaq(FaqVO faq) {
		dao.insertFaq(faq);
	}
	
	public void updateFaq(FaqVO faq) {
		dao.updateFaq(faq);
	}
	
	public void deleteFaq(int no) {
		dao.deleteFaq(no);
	}

	public void insertNotice(NoticeVO notice, MultipartHttpServletRequest mRequest) {
		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/");
//				System.out.println(uploadDir);

		// ModelAndView mav = new ModelAndView("file/uploadResult");

		// System.out.println("OwnerServiceImp id : " + owner.getId());

		Iterator<String> iter = mRequest.getFileNames();
		while (iter.hasNext()) {

			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);

			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			// System.out.println("원본 파일명 : " + oriFileName);

			if (oriFileName != null && !oriFileName.equals("")) {

				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}

				// 파일 사이즈
				long fileSize = mFile.getSize();
				// System.out.println("파일 사이즈 : " + fileSize);

				// 고유한 파일명 만들기
				String saveFileName = "quration-" + UUID.randomUUID().toString() + ext;
				// System.out.println("저장할 파일명 : " + saveFileName);

				// 임시저장된 파일을 원하는 경로에 저장
				try {
					mFile.transferTo(new File(uploadDir + "/" + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}

				NoticeAttachVO noticeAttach = new NoticeAttachVO();
				noticeAttach.setOriName(oriFileName);
				noticeAttach.setSavedName(saveFileName);
				noticeAttach.setFileSize((int) fileSize);
				
				dao.insertNotice(notice);
				dao.insertNoticeAttach(noticeAttach);
			}
		}
	}

	public void updateNotice(NoticeVO notice) {
		dao.updateNotice(notice);
	}

	public void deleteNotice(int no) {
		dao.deleteNotice(no);
	}
}
