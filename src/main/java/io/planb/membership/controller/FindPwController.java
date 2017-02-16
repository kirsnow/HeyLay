package io.planb.membership.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import io.planb.member.service.MemberService;
import io.planb.member.vo.IdentifyQuestionVO;
import io.planb.member.vo.MemberVO;

@Controller
public class FindPwController {

	@Autowired
	private MemberService service;
	
	/*비밀번호 찾기*/
	@RequestMapping(value="/membership/findPw.do", method=RequestMethod.GET)
	public String findPw(Model model) {
		
		List<IdentifyQuestionVO> idenQuestionList = service.selectIdenQuestion();
		model.addAttribute("idenQuestionList", idenQuestionList);
		
		return "membership/find_password";
	}
	
	@RequestMapping(value = "/membership/findPw.do", method = RequestMethod.POST)
	   public String findPwForm(@ModelAttribute("member") MemberVO member, Model model) {
		
		String userPassword = service.selectMemberPassword(member);
        
		if (userPassword != null) {
			model.addAttribute("userPassword", userPassword);
			System.out.println("userPassword :" + userPassword);

			return "membership/tell_password";

		} else {
			model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
			
			//질문 리스트 재 소환 (이거 없으면 질문이 안뜸)
			List<IdentifyQuestionVO> idenQuestionList = service.selectIdenQuestion();
			model.addAttribute("idenQuestionList", idenQuestionList);

			return "membership/find_password";

		}
	}
}
