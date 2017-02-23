package io.planb.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import io.planb.leaved.vo.LeavedVO;
import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;

@RequestMapping("/myPage")
@Controller
public class LeavedContorller {

	@Autowired
	private MemberService service;
	
	/*회원 탈퇴 재문의 _ ajax */
	@ResponseBody
	@RequestMapping(value = "/withdrawQuestionCnt.do")
	public int withdrawQuestion(HttpSession session, Model model) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int memberNo = userVO.getNo();
		
		int withdrawContentCnt = service.selectWithdrawContentCnt(memberNo);
		//System.out.println("controller withdrawContentCnt : " + withdrawContentCnt);
		
		return withdrawContentCnt;
	}
	
	/*회원 탈퇴 재문의 _ 페이지 호출 */
	@RequestMapping(value = "/withdrawQuestion.do")
	public String withdrawQuestionForm() {

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
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		leaved.setMemberNo(userNo);
		service.withdrawReason(leaved);
		System.out.println("leaved: " + leaved);
		
		service.withdraw(userVO);
		
		session.invalidate();
		return "redirect:/";
	}
}