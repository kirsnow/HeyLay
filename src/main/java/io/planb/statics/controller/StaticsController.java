package io.planb.statics.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import io.planb.statics.service.StaticsService;
import io.planb.statics.vo.StaticsVO;

@Controller
public class StaticsController {
	
	@Autowired
	private StaticsService service;
	
	/* 내가 많이 담은 사이트 */
	@RequestMapping("/statics/savedSource.do")
	public String selectSavedSource(HttpSession session,Model model) {
		String member = (String) session.getAttribute("userVO");
		
		List<StaticsVO> statisticList = service.selectSavedSource(member);
		model.addAttribute("statisticList", statisticList);
		
		return "admin/statistic";
	}
	
}
