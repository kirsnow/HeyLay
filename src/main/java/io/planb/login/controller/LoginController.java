package io.planb.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;



@SessionAttributes("userVO")
@Controller
public class LoginController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/login/login.do", method=RequestMethod.GET)
	public String loginForm() {
		
		return "login/login";
	}
	
	@RequestMapping(value="/login/login.do", method=RequestMethod.POST)
	public String login(@ModelAttribute("member") MemberVO member, Model model) {
	
		MemberVO userVO = service.login(member);
		
		if(userVO != null) {
			
			model.addAttribute("userVO", userVO);
//			model.addAttribute("msg", userVO.getFirstName() + "님 환영합니다.");
			/*System.out.println(userVO.getEmail());*/
			return "redirect:/";
			
			
		} else {
			model.addAttribute("msg", "아이디 또는 패스워드가 일치하지 않습니다.");
		}
		
		return "login/login";

		
		
	}
	
	@RequestMapping("/login/logout.do")
	public String logout(SessionStatus sessionStatus  /*HttpServletRequest request*/) {
		
		sessionStatus.setComplete();
		
		return "redirect:/";
	}
}











