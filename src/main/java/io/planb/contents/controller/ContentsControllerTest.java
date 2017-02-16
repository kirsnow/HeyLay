package io.planb.contents.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.service.ContentsServiceTest;
import io.planb.member.vo.MemberVO;

@SessionAttributes("userVO")
@Controller
public class ContentsControllerTest {

	@Autowired
	private ContentsServiceTest service;
	
	@RequestMapping("/contents/drawer-test.do")
	public ModelAndView selectSavedList(HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			userVO = new MemberVO();
			userVO.setNo(3);
			mav.addObject("userVO", userVO);
		}
		
		/*if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {*/
			int memberNo = userVO.getNo();
			System.out.println("memberNo: " + memberNo);
			
			
			mav.setViewName("contents/drawer");
			mav.addObject("cards", memberNo);
		/*}*/
		
		return mav;
	}

}
