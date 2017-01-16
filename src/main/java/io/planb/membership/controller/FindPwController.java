package io.planb.membership.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;

@SessionAttributes("userPw")
@Controller
public class FindPwController {

	@Autowired
	private MemberService service;
	
	/*비밀번호 찾기*/
	@RequestMapping(value="/membership/findPw.do", method=RequestMethod.GET)
	public String findAccount() {
		
		return "membership/find_password";
	}
	
	@RequestMapping(value = "/membership/findPw.do", method = RequestMethod.POST)
	   public String findAccountForm(@ModelAttribute("member") MemberVO member, Model model) {

		System.out.println(member);

		MemberVO userPw = service.findPw(member);

		if (userPw != null) {
			model.addAttribute("userPw", userPw);

			return "membership/tell_password";
		} else {
			model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
			return "membership/find_password";
		}
	}

	@RequestMapping(value="/membership/tellPw.do", method=RequestMethod.GET)
	public String tellAccount() {
		
		return "membership/tell_password";
	}
	
	@RequestMapping(value="membership/tellPw.do", method=RequestMethod.POST)
	public String tellAccountForm(@ModelAttribute("member") MemberVO member, Model model) {
		
		
		return "membership/tell_password";
	}	
}
