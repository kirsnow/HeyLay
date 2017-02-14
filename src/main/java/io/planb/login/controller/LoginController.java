package io.planb.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import io.planb.keywords.vo.KeywordsVO;
import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;
import io.planb.member.vo.SelectKeywordVO;



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
	public String login(@ModelAttribute("member") MemberVO member, Model model , KeywordsVO interestKeyword) {
	
		MemberVO userVO = service.login(member);
		
		List<KeywordsVO> interestKeywordList = service.selectInterestList();
		model.addAttribute("interestKeywordList", interestKeywordList);
		//System.out.println("interestKeywordList : " + interestKeywordList);
		
		if(userVO != null) {
			
			model.addAttribute("userVO", userVO);
			
			return "membership/interest";
			
		} else {
			
			model.addAttribute("msg", "아이디 또는 패스워드가 일치하지 않습니다.");
		}
		
		return "login/login";
	}
	
}











