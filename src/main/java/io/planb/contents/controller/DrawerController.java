package io.planb.contents.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.service.DrawerService;
import io.planb.contents.vo.DrawerVO;
import io.planb.member.vo.MemberVO;

@SessionAttributes("userVO")
@RequestMapping("/drawer")
@Controller
public class DrawerController {
	
	@Autowired
	private DrawerService service;
	
	@RequestMapping("/days.do")
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
			
			List<DrawerVO> cardsByDays = service.getSavedCardsByDays(memberNo);
			
			mav.setViewName("drawer/days");
			mav.addObject("cardsByDays", cardsByDays);
		/*}*/
		
		return mav;
	}
}
