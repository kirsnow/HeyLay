package io.planb.statics.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.planb.member.vo.MemberVO;
import io.planb.statics.service.StaticsService;
import io.planb.statics.vo.StaticsListVO;
import io.planb.statics.vo.StaticsVO;

@Controller
public class StaticsController {
	
	@Autowired
	private StaticsService service;
	
	/* 내가 많이 담은 사이트 */
	@ResponseBody
	@RequestMapping("/statics/savedSource.do")
	public StaticsListVO selectSavedSource(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
//		System.out.println("controller no : " + no);
		
		List<StaticsVO> staticsList = service.selectSavedSource(no);
		
//		System.out.println("controller staticsList : " + staticsList);
		
		return new StaticsListVO(staticsList);
	}
	
	/* 내가 많이 담은 사이트 타입 */
	@ResponseBody
	@RequestMapping("/statics/sourceType.do")
	public StaticsListVO selectSourceType(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
		System.out.println("controller no : " + no);
		
		List<StaticsVO> staticsList = service.selectSourceType(no);
		
		System.out.println("controller staticsList : " + staticsList);
		
		return new StaticsListVO(staticsList);
	}
	
}
