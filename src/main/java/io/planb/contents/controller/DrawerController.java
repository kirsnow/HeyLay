package io.planb.contents.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.service.DrawerService;
import io.planb.contents.vo.DrawerVO;
import io.planb.member.vo.MemberVO;

@Controller
public class DrawerController {
	
	@Autowired
	private DrawerService service;
	
	@RequestMapping("/drawer.do")
	public ModelAndView selectSavedByDays(HttpSession session, @RequestParam(required=false) String sort) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {
			int memberNo = userVO.getNo();
			System.out.println("memberNo: " + memberNo);
			
			List<DrawerVO> cardsByDays = service.getDrawerList(memberNo, sort);
			
			mav.setViewName("contents/drawer");
			mav.addObject("cardsByDays", cardsByDays);
		}
		return mav;
	}
}
