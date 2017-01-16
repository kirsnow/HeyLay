package io.planb.contact.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import io.planb.bugAttach.vo.BugAttachVO;
import io.planb.contact.dao.ContactDAOImp;
import io.planb.contact.vo.ReportVO;
import io.planb.noticeAttach.vo.NoticeAttachVO;
import io.planb.question.vo.QuestionVO;

@Service
public class ContactServiceImp {

	@Autowired
	private ContactDAOImp dao;
	
	@Autowired
	private ServletContext servletContext;
	
	public void sendQuestion(QuestionVO questionVO) {
		dao.sendQuestion(questionVO);
	}

	public void sendPartnership(QuestionVO questionVO) {
		dao.sendPartnership(questionVO);
	}
	
	public void sendBugReport(ReportVO reportVO, MultipartFile multipartFile) {
		dao.sendBugReport(reportVO);
		
		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/");
		
		if (! multipartFile.isEmpty()) {

			// 원본 파일명
			String oriFileName = multipartFile.getOriginalFilename();
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
				long fileSize = multipartFile.getSize();
				// System.out.println("파일 사이즈 : " + fileSize);

				// 고유한 파일명 만들기
				String saveFileName = "quration-" + UUID.randomUUID().toString() + ext;
				// System.out.println("저장할 파일명 : " + saveFileName);

				// 임시저장된 파일을 원하는 경로에 저장
				try {
					multipartFile.transferTo(new File(uploadDir + "/" + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}

				BugAttachVO bugAttach = new BugAttachVO();
				bugAttach.setOriName(oriFileName);
				bugAttach.setSavedName(saveFileName);
				bugAttach.setFileSize((int) fileSize);
				
				dao.sendBugReportAttach(bugAttach);
			}
		}
	}

	public void sendSpamContents(ReportVO reportVO) {
		dao.sendSpamContents(reportVO);
	}

	public void sendSpamMemo(ReportVO reportVO) {
		dao.sendSpamMemo(reportVO);
	}


}
