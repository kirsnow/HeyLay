package io.planb.admin.help.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.admin.help.dao.HelpDAO;
import io.planb.answer.vo.AnswerVO;
import io.planb.contentsSpam.vo.ContentsSpamVO;
import io.planb.faq.vo.FaqVO;
import io.planb.notice.vo.NoticeVO;
import io.planb.question.vo.QuestionVO;

@Service
public class HelpService {
	
	@Autowired
	private HelpDAO dao;

	public List<QuestionVO> selectQuestionList() {
		List<QuestionVO> questionList = dao.selectQuestionList();
		return questionList;
	}
	
	public int countQuestion() {
		int questionCnt = dao.countQuestion();

		return questionCnt;
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
	
	public void insertNotice(NoticeVO notice) {
		dao.insertNotice(notice);
	}

//	public void insertNotice(MultipartFile multipartFile, NoticeVO notice) {
//		// 실행되는 웹어플리케이션의 실제 경로 가져오기
//		String uploadDir = servletContext.getRealPath("/upload/");
////		System.out.println("uploadDir : " + uploadDir);
//
//		// ModelAndView mav = new ModelAndView("file/uploadResult");
//
//		// System.out.println("OwnerServiceImp id : " + owner.getId());
//
//		dao.insertNotice(notice);
//
//		if (! multipartFile.isEmpty()) {
//
//			// 원본 파일명
//			String oriFileName = multipartFile.getOriginalFilename();
//			// System.out.println("원본 파일명 : " + oriFileName);
//
//			if (oriFileName != null && !oriFileName.equals("")) {
//
//				// 확장자 처리
//				String ext = "";
//				// 뒤쪽에 있는 . 의 위치
//				int index = oriFileName.lastIndexOf(".");
//				if (index != -1) {
//					// 파일명에서 확장자명(.포함)을 추출
//					ext = oriFileName.substring(index);
//				}
//
//				// 파일 사이즈
//				long fileSize = multipartFile.getSize();
//				// System.out.println("파일 사이즈 : " + fileSize);
//
//				// 고유한 파일명 만들기
//				String saveFileName = "quration-" + UUID.randomUUID().toString() + ext;
//				// System.out.println("저장할 파일명 : " + saveFileName);
//
//				// 임시저장된 파일을 원하는 경로에 저장
//				try {
//					multipartFile.transferTo(new File(uploadDir + "/" + saveFileName));
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//
//				NoticeAttachVO noticeAttach = new NoticeAttachVO();
//				noticeAttach.setOriName(oriFileName);
//				noticeAttach.setSavedName(saveFileName);
//				noticeAttach.setFileSize((int) fileSize);
//				
////				System.out.println("Service notice : " + notice);
////				System.out.println("Service noticeAttach : " + noticeAttach);
//				
//				dao.insertNoticeAttach(noticeAttach);
//			}
//		}
//	}

	public void updateNotice(NoticeVO notice) {
		dao.updateNotice(notice);
	}
	
//	public void updateNotice(MultipartFile multipartFile, NoticeVO notice) {
//		// 실행되는 웹어플리케이션의 실제 경로 가져오기
//		String uploadDir = servletContext.getRealPath("/upload/");
////		System.out.println("uploadDir : " + uploadDir);
//
//		// ModelAndView mav = new ModelAndView("file/uploadResult");
//
//		// System.out.println("OwnerServiceImp id : " + owner.getId());
//
//		dao.updateNotice(notice);
//
//		if (! multipartFile.isEmpty()) {
//
//			// 원본 파일명
//			String oriFileName = multipartFile.getOriginalFilename();
//			// System.out.println("원본 파일명 : " + oriFileName);
//
//			if (oriFileName != null && !oriFileName.equals("")) {
//
//				// 확장자 처리
//				String ext = "";
//				// 뒤쪽에 있는 . 의 위치
//				int index = oriFileName.lastIndexOf(".");
//				if (index != -1) {
//					// 파일명에서 확장자명(.포함)을 추출
//					ext = oriFileName.substring(index);
//				}
//
//				// 파일 사이즈
//				long fileSize = multipartFile.getSize();
//				// System.out.println("파일 사이즈 : " + fileSize);
//
//				// 고유한 파일명 만들기
//				String saveFileName = "quration-" + UUID.randomUUID().toString() + ext;
//				// System.out.println("저장할 파일명 : " + saveFileName);
//
//				// 임시저장된 파일을 원하는 경로에 저장
//				try {
//					multipartFile.transferTo(new File(uploadDir + "/" + saveFileName));
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//
//				NoticeAttachVO noticeAttach = new NoticeAttachVO();
//				noticeAttach.setOriName(oriFileName);
//				noticeAttach.setSavedName(saveFileName);
//				noticeAttach.setFileSize((int) fileSize);
//				noticeAttach.setNoticeNo(notice.getNo());
//				
////				System.out.println("Service notice : " + notice);
////				System.out.println("Service noticeAttach : " + noticeAttach);
//				
//				dao.updateNoticeAttach(noticeAttach);
//			}
//		}
//	}

	public void deleteNotice(int no) {
		dao.deleteNotice(no);
	}

	public NoticeVO selectNoticeDetail(int no) {
		NoticeVO notice = dao.selectNoticeDetail(no);
		return notice;
	}

	public List<ContentsSpamVO> seleteContentsSpamList(String type) {
		List<ContentsSpamVO> contentsSpamList = new ArrayList<>();
		
		switch(type) {
			case "C": 
				contentsSpamList = dao.seleteContentsSpamList();
				break;
			case "M":
				contentsSpamList = dao.seleteMemoSpamList();
				break;
		}
		
		return contentsSpamList;
	}

	public int countContentsSpam(String type) {
		int spamCnt = 0;
		
		switch(type) {
			case "C": 
				spamCnt = dao.countContentsSpam();
				break;
			case "M":
				spamCnt = dao.countMemoSpam();
				break;
		}
		
		return spamCnt;
	}


	public void deleteContentsSpam(ArrayList<Integer> list, String type) {
		for(Integer no : list) {
			switch(type) {
				case "C":
					dao.deleteContentsSpam(no);
					break;
				case "M":
					dao.deleteMemoSpam(no);
					break;
			}
		}
	}

	public ContentsSpamVO selectSpamDetail(int no, String type) {
		ContentsSpamVO spam = new ContentsSpamVO();
		
		switch(type) {
			case "C": 
				spam = dao.selectContentsSpamDetail(no);
				break;
			case "M":
				spam = dao.selectMemoSpamDetail(no);
				break;
		}
		
		return spam;
	}

	public List<ContentsSpamVO> seleteSpamList(String type) {
		List<ContentsSpamVO> spamList = new ArrayList<>();
		
		switch(type) {
			case "C":
				spamList = dao.seleteSpamContentList();
				break;
			case "M":
				spamList = dao.seleteSpamMemoList();
				break;
		}
		
		return spamList;
	}

	public int countSpam(String type) {
		int spamCnt = 0;
		
		switch(type) {
			case "C":
				spamCnt = dao.countSpamContent();
				break;
			case "M":
				spamCnt = dao.countSpamMemo();
				break;
		}
		
		return spamCnt;
	}

	public void deleteQna(ArrayList<Integer> list) {
		for(Integer no : list) {
			dao.deleteQna(no);
		}
	}
	
	public void deleteQna(int no) {
		dao.deleteQna(no);
	}

	public void updateContentsSpamBan(ArrayList<Integer> list, String type) {
		for(Integer no : list) {
			
			switch(type) {
			case "C":
				dao.updateContentsSpamContentsBan(no);
				break;
			case "M":
				dao.updateContentsSpamMemoBan(no);
				break;
			}
			
		}
	}
}
