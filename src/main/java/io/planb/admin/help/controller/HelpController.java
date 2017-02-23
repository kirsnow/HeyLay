package io.planb.admin.help.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import io.planb.admin.help.service.HelpService;
import io.planb.answer.vo.AnswerVO;
import io.planb.contentsSpam.vo.ContentsSpamVO;
import io.planb.faq.vo.FaqVO;
import io.planb.notice.vo.NoticeVO;
import io.planb.question.vo.QuestionVO;

@Controller
public class HelpController {
	
	@Autowired
	private HelpService service;
	
	/* Q&A 목록 조회 */
	@RequestMapping("/jsp/admin/qna_list.do")
	public String selectQnaList(Model model) {
		List<QuestionVO> questionList = service.selectQuestionList();
		model.addAttribute("questionList", questionList);
		
		return "admin/qna_list";
	}
	
	/* Q&A 디테일 조회 */
	@RequestMapping("/jsp/admin/qna_detail.do")
	public String selectQnaDetail(@RequestParam("no") int no, Model model) {
		System.out.println("Controller no : " + no);
		
		QuestionVO question = service.selectQuestionDetail(no);
		AnswerVO answer = service.selectAnswerDetail(no);
		
		model.addAttribute("question", question);
		model.addAttribute("answer", answer);
		
		return "admin/qna_detail";
	}
	
	/* Q&A 질문 삭제 단일*/
	@RequestMapping(value="/jsp/admin/qna_delete.do", method=RequestMethod.GET)
	public String deleteQna(@RequestParam("no") int no, Model model) {
		service.deleteQna(no);
		
		return "admin/qna_list";
	}
	
	/* Q&A 질문 삭제 여러 개*/
	@ResponseBody
	@RequestMapping(value="/jsp/admin/qna_delete.do", method=RequestMethod.POST)
	public String deleteQna(@RequestParam(value="checkboxValues[]") List<Integer> param, Model model) {
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
		
		service.deleteQna(list);
		
		return "완료";
	}
	
	/* 자주 묻는 질문 작성 폼 이동 */
	@RequestMapping(value="/jsp/admin/faq_write.do", method=RequestMethod.GET)
	public String insertFaqForm() {
		return "admin/faq_write";
	}
	
	/* 자주 묻는 질문 등록 */
	@RequestMapping(value="/jsp/admin/faq_write.do", method=RequestMethod.POST)
	public String insertFaq(@ModelAttribute FaqVO faq) {
		service.insertFaq(faq);
		
		return "faq/faq_form";
	}
	
	/* 자주 묻는 질문 수정 폼 이동 */
	@RequestMapping(value="/jsp/admin/faq_modify.do", method=RequestMethod.GET)
	public String updateFaqForm() {
		return "admin/faq_modify";
	}
	
	/* 자주 묻는 질문 수정 */
	@RequestMapping(value="/jsp/admin/faq_modify.do", method=RequestMethod.POST)
	public String updateFaq(@ModelAttribute FaqVO faq) {
		service.updateFaq(faq);
		
		return "faq/faq_form";
	}
	
	/* 자주 묻는 질문 삭제 */
	@RequestMapping("/jsp/admin/faq_delete.do")
	public String deleteFaq(@RequestParam("no") int no) {
		service.deleteFaq(no);
		
		return "faq/faq_form";
	}
	
	/* 공지 사항 작성 폼 이동 */
	@RequestMapping(value = "/jsp/admin/notice_write.do", method = RequestMethod.GET)
	public String insertNoticeForm() {
		return "admin/notice_write";
	}
	
	/* 공지 사항 등록 */
	@RequestMapping(value = "/jsp/admin/notice_write.do", method = RequestMethod.POST)
	public String insertNotice(@RequestParam("attachfile") MultipartFile multipartFile, @ModelAttribute NoticeVO notice) {
		service.insertNotice(multipartFile, notice);
		
		return "notice/notice_list";
	}
	
	/* 공지 사항 수정 폼 이동 */
	@RequestMapping(value = "/jsp/admin/notice_modify.do", method = RequestMethod.GET)
	public String updateNoticeForm(@RequestParam("no") int no, Model model) {
		NoticeVO notice = service.selectNoticeDetail(no);
		model.addAttribute("notice", notice);
		
		return "admin/notice_modify";
	}
	
	/* 공지 사항 수정 */
	@RequestMapping("/jsp/admin/notice_modify.do")
	public String updateNotice(@RequestParam("attachfile") MultipartFile multipartFile, @ModelAttribute NoticeVO notice) {
		service.updateNotice(multipartFile, notice);
		
		return "notice/notice_list";
	}
	
	/* 공지 사항 삭제 */
	@RequestMapping("/jsp/admin/notice_delete.do")
	public String deleteNotice(@RequestParam("no") int no) {
		service.deleteNotice(no);
		
		return "notice/notice_list";
	}
	
	/* 유해 콘텐츠, 메모 신고 목록 조회 (C: 콘텐츠 / M: 메모) */
	@RequestMapping("/jsp/admin/spam_list.do")
	public String seleteContentsSpamList(HttpServletRequest request, Model model) {
		String type = "C";
		if(request.getParameter("type") != null) type = request.getParameter("type");
		
		List<ContentsSpamVO> spamList = service.seleteContentsSpamList(type);
		model.addAttribute("spamList", spamList);
		
		int spamCnt = service.countContentsSpam(type);
		model.addAttribute("spamCnt", spamCnt);
		
		model.addAttribute("option", type);
		
		return "admin/spam_list";
	}
	
	/* 유해 신고 콘텐츠, 메모 차단 (여러 개) */
	@RequestMapping("/jsp/admin/spam_modify_ban.do")
	public String updateContentsSpamBan(@RequestParam(value="checkboxValues[]") List<Integer> param, @RequestParam(value="selectedValue") String type) {
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
		
		service.updateContentsSpamBan(list, type);

		return "완료";
	}
	
	/* 유해 콘텐츠, 메모 신고 삭제 (여러 개) */
	@RequestMapping("/jsp/admin/spam_delete.do")
	public String deleteContentsSpam(@RequestParam(value="checkboxValues[]") List<Integer> param, @RequestParam(value="selectedValue") String type) {
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
        
		service.deleteContentsSpam(list, type);

		return "admin/spam_content_list";
	}
	
	/* 유해 콘텐츠, 메모 신고 상세 조회 (C: 콘텐츠 / M: 메모) */
	@RequestMapping("/jsp/admin/spam_detail.do")
	public String selectSpamDetail(@RequestParam("no") int no, @RequestParam("type") String type, Model model) {
		ContentsSpamVO spam = service.selectSpamDetail(no, type);
		model.addAttribute("spam", spam);
		
		return "admin/spam_detail";
	}
	
	/* 유해 콘텐츠, 메모 목록 조회 */
	@RequestMapping("/jsp/admin/spam_content_list.do")
	public String seleteSpamList(HttpServletRequest request, Model model) {
		String type = "C";
		if(request.getParameter("type") != null) type = request.getParameter("type");
		
		List<ContentsSpamVO> spamList = service.seleteSpamList(type);
		model.addAttribute("spamList", spamList);
		
		int spamCnt = service.countSpam(type);
		model.addAttribute("spamCnt", spamCnt);
		
		model.addAttribute("option", type);
		
		return "admin/spam_content_list";
	}

}
