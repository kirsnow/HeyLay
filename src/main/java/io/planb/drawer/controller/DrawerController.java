package io.planb.drawer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import io.planb.drawer.service.DrawerService;
import io.planb.drawer.vo.DrawerVO;
import io.planb.member.vo.MemberVO;
import io.planb.memo.service.MemoServiceImp;

@Controller
public class DrawerController {
	
	@Autowired
	private DrawerService service;
	
	@Autowired
	private MemoServiceImp memoService;
	
	@RequestMapping("/drawer.do")
	public ModelAndView selectSavedByDays(HttpSession session, @RequestParam(required=false) String sort) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {
			int memberNo = userVO.getNo();
			
			List<DrawerVO> cardsByDays = service.getDrawerList(memberNo, sort);
			
			mav.setViewName("drawer/drawer");
			mav.addObject("cardsByDays", cardsByDays);
		}
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/drawer/ajax/saveCard.do")
	public String saveCard(HttpSession session
			, @RequestParam int contentsNo, @RequestParam int dirNo
			, @RequestParam String dirName
			, @RequestParam(required=false) String memoMessage) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		String result = null;
		
		if(userVO == null) {
			result = "로그인 후 시도해 주십시오.";
		} else {
			service.saveCard(userNo, contentsNo, dirName, dirNo);
			
			if(memoMessage != null && !memoMessage.equals("")) {
				result = memoService.addMemoAjax(userNo, contentsNo, memoMessage);
			}
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/drawer/ajax/delCard.do")
	public String delCard(HttpSession session, @RequestParam int contentsNo) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		String result = null;
		
		if(userVO == null) {
			result = "로그인 후 시도해 주십시오";
		} else {
			service.delCard(userNo, contentsNo);
			result = "Succeed";
		}
		return result;
	}
	
}
