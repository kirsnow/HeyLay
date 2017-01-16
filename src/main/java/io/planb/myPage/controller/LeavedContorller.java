package io.planb.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import io.planb.leaved.vo.LeavedVO;
import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;

@RequestMapping("/myPage")
@Controller
public class LeavedContorller {

	@Autowired
	private MemberService service;
	
	/*회원 탈퇴 재문의*/
	@RequestMapping(value = "/withdrawQuestion.do", method = RequestMethod.GET)
	public String withdrawQuestion() {
		
		return "myPage/leaved_question";
	}
	
	/*회원 탈퇴 사유 페이지 이동*/
	@RequestMapping(value = "/moveWithdrawReason.do", method = RequestMethod.GET)
	public String moveWithdrawResaon() {
		
		return "myPage/leaved";
	}
	
	@RequestMapping(value = "/moveWithdrawReason.do", method=RequestMethod.POST)
	public String moveWithdrawResaonForm() {
		
		return "myPage/leaved";
	}

	/* 회원 탈퇴  및 사유 입력*/
	@RequestMapping("/withdraw.do")
	public String withdrawQuestion(LeavedVO leaved, HttpSession session) {
		System.out.println("leaved: " + leaved);
		service.withdrawReason(leaved);
		service.withdraw(leaved.getMemberNo());
		
		session.invalidate();
		return "redirect:/";
	}
}