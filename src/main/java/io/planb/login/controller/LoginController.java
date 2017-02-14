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
	public String login(@ModelAttribute("member") MemberVO member, Model model) {
		MemberVO userVO = service.login(member);
		
		if(userVO != null) {
			if(userVO.getPassword().equals(member.getPassword())) { 
				model.addAttribute("userVO", userVO);

				if(userVO.getSelectKeywords() == 0) {
					System.out.println(userVO.toString());
					
					List<KeywordsVO> interestKeywordList = service.selectInterestList();
					model.addAttribute("interestKeywordList", interestKeywordList);
					
					return "membership/interest";
				} else return "/";
			}
			else model.addAttribute("msg", "잘못된 비밀번호입니다. 다시 시도하세요.");
		} else model.addAttribute("msg", "이메일을 인식할 수 없습니다. 다시 시도하세요.");
		
		return "login/login";
	}
	
    @RequestMapping("/login/logout.do")
    public String logout(SessionStatus sessionStatus  /*HttpServletRequest request*/) {
       
    	sessionStatus.setComplete();
        
    	return "redirect:/";
    }
}











