package io.planb.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;

@RequestMapping("/myPage")
@Controller
public class ProfileFormController {
		
		
		@Autowired
		private MemberService service;
		
		//회원 정보 확인 
		@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
		public String profile() {
			
			return "myPage/profile_form";
		}
		
		@RequestMapping(value="/mypage.do", method=RequestMethod.POST)
		public String profileForm(@ModelAttribute("userVO") MemberVO member, Model model) {
			
			model.addAttribute("userVO", member);
			return "myPage/profile_form";	
		}
		
		/* 회원정보 수정 */ 
		@RequestMapping(value="/update.do", method=RequestMethod.POST)
		public ModelAndView newPassword(@ModelAttribute MemberVO member, HttpSession session) {
				                  		  
			
			MemberVO userVO = (MemberVO) session.getAttribute("userVO");
			member.setNo(userVO.getNo());
			member.setQuestion(userVO.getQuestion());
			member.setAnswer(userVO.getAnswer());
		
			service.mypageUpdate(member);

			ModelAndView mav = new ModelAndView();
			mav.setViewName("myPage/profile_form");
			mav.addObject("userVO",member);
			
			return mav;	
		}
	}
