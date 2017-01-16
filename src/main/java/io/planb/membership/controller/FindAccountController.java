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

@SessionAttributes("userAccount")
@Controller
public class FindAccountController {

	@Autowired
	private MemberService service;
	
	
	/*게정 찾기*/
	@RequestMapping(value="/membership/findAccount.do", method=RequestMethod.GET)
	public String findAccount() {
		
		return "membership/find_account";
	}
	
	@RequestMapping(value = "/membership/findAccount.do", method = RequestMethod.POST)
	   public String findAccountForm(@ModelAttribute("member") MemberVO member, Model model) {
		
		System.out.println(member);

		MemberVO userAccount = service.findAccount(member);

		if (userAccount != null) {
			model.addAttribute("userAccount", userAccount);
			System.out.println(userAccount);
			
			return "membership/tell_account";
		} else {
			model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
			return "membership/find_account";
		}
	}

	@RequestMapping(value="/membership/tellAccount.do", method=RequestMethod.GET)
	public String tellAccount() {
		
		return "membership/tell_account";
	}
	
	@RequestMapping(value="membership/tellAccount.do", method=RequestMethod.POST)
	public String tellAccountForm(@ModelAttribute("member") MemberVO member, Model model) {
		
		
		return "membership/tell_account";
	}	
}
