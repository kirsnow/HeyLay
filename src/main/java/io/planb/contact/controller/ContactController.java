package io.planb.contact.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import eu.bitwalker.useragentutils.UserAgent;
import io.planb.contact.service.ContactServiceImp;
import io.planb.contact.vo.ReportVO;
import io.planb.question.vo.QuestionVO;

@RequestMapping("/contact")
@Controller
public class ContactController {

	@Autowired
	private ContactServiceImp service; 
	
	//Q&A
	@RequestMapping(value="/qna.do", method=RequestMethod.GET)
	public String writeQuestion() {
		return "contact/qna";
	}
	
	@RequestMapping(value="/qna.do", method=RequestMethod.POST)
	public ModelAndView sendQuestion(QuestionVO questionVO) {
		service.sendQuestion(questionVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contact/qna");
		mav.addObject("msg", "질문이 등록되었습니다. 답변은 기재하신 이메일(" + questionVO.getEmail() + ")로 발송됩니다.");
		return mav;
	}
	
	
	//Partnership
	@RequestMapping(value="/partnership.do", method=RequestMethod.GET)
	public String writePartnership() {
		return "contact/partnership";
	}
	
	@RequestMapping(value="/partnership.do", method=RequestMethod.POST)
	public ModelAndView sendPartnership(QuestionVO questionVO) {
		service.sendPartnership(questionVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contact/partnership");
		mav.addObject("msg", "제휴문의가 등록되었습니다. 답변은 기재하신 이메일(" + questionVO.getEmail() + ")로 발송됩니다.");
		return mav;
	}
	
	
	//Bug report
	@RequestMapping(value="/bug.do", method=RequestMethod.GET)
	public ModelAndView writeBugReport(HttpServletRequest request) {
		UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contact/bug");
		mav.addObject("userAgent", userAgent);
		return mav;
	}
	
	@RequestMapping(value="/bug.do", method=RequestMethod.POST)
	public ModelAndView sendBugReport(@ModelAttribute ReportVO reportVO, @RequestParam("attachfile") MultipartFile multipartFile) {
		
		service.sendBugReport(reportVO, multipartFile);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	
	//Spam Contents
	@RequestMapping(value="/spamContents.do", method=RequestMethod.GET)
	public String writeSpamContents() {
		return "contact/contents_spam";
	}
	
	@RequestMapping(value="/spamContents.do", method=RequestMethod.POST)
	public ModelAndView sendSpamContents(ReportVO reportVO) {
		service.sendSpamContents(reportVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contact/contents_spam");
		mav.addObject("msg", "유해 게시물 신고가 등록되었습니다.");
		return mav;
	}
	
	//Spam Memo
	@RequestMapping(value="/spamMemo.do", method=RequestMethod.GET)
	public String writeSpamMemo() {
		return "contact/memo_spam";
	}
	
	@RequestMapping(value="/spamMemo.do", method=RequestMethod.POST)
	public ModelAndView sendSpamMemo(ReportVO reportVO) {
		service.sendSpamMemo(reportVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contact/memo_spam");
		mav.addObject("msg", "유해 게시글 신고가 등록되었습니다.");
		return mav;
	}
	
}
