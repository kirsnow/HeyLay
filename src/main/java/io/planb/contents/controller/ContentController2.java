package io.planb.contents.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.service.ContentService2;
import io.planb.contents.vo.ContentsVO;
import io.planb.member.vo.MemberVO;

@SessionAttributes("userVO")
@Controller
public class ContentController2 {

	@Autowired
	private ContentService2 service;
	
	@RequestMapping("/contents/drawer.do")
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
			
			List<ContentsVO> savedCards = service.getSavedCards(memberNo);
			
			mav.setViewName("contents/drawer");
			mav.addObject("cards", savedCards);
		/*}*/
		
		return mav;
	}

}
