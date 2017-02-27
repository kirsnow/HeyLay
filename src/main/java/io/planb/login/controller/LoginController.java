package io.planb.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import io.planb.keywords.vo.KeywordsVO;
import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;

//@SessionAttributes("userVO")
@Controller
public class LoginController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/login/login.do", method=RequestMethod.GET)
	public String loginForm(HttpServletRequest request) {
		
		String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("prevPage", referrer);
	    
//	    System.out.println("referrer: " + referrer);
		
		return "login/login";
	}
	
	@RequestMapping(value="/login/login.do", method=RequestMethod.POST)
	public String login(@ModelAttribute("member") MemberVO member, Model model) {
		MemberVO userVO = service.login(member);
		
		
		service.updateDate(member);
		// member.getEmail()이랑 email 일치하는 userVO 가 있다면
		if(userVO != null) {
			
			// member.getPassword()랑 userVO.getPassword가 일치한다면
			if(userVO.getPassword().equals(member.getPassword())) { 
				model.addAttribute("userVO", userVO);

				// 로그인 된 유저의 선호 키워드가 없다면
				if(userVO.getSelectKeywords() == 0) {
					List<KeywordsVO> interestKeywordList = service.selectInterestList();
					model.addAttribute("interestKeywordList", interestKeywordList);
					
					return "membership/interest";
				} else return "redirect:/";
			}
			else model.addAttribute("msg", "잘못된 비밀번호입니다. 다시 시도하세요.");
		} else model.addAttribute("msg", "이메일을 인식할 수 없습니다. 다시 시도하세요.");
		
		return "login/login";
	}
	
	@RequestMapping("/login/interest.do")
	public String interest(Model model) {
//		System.out.println("interest controller");
		
		List<KeywordsVO> interestKeywordList = service.selectInterestList();
		model.addAttribute("interestKeywordList", interestKeywordList);
		
		return "membership/interest";
	}
	
    @RequestMapping("/login/logout.do")
    public String logout(SessionStatus sessionStatus  /*HttpServletRequest request*/) {
       
    	sessionStatus.setComplete();
        
    	return "redirect:/";
    }
}

