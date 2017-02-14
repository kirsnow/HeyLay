package io.planb.contents.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.service.ContentService;
import io.planb.contents.vo.ContentsVO;
import io.planb.contents.vo.SavedHeaderVO;
import io.planb.contents.vo.SavedVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.member.vo.MemberVO;

@Controller
public class ContentController {

	@Autowired
	private ContentService service;
	
	@RequestMapping("/contents/drawer_day.do")
	public ModelAndView selectDayList(HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {
			int memberNo = userVO.getNo();
			
			List<SavedHeaderVO> drawerHeaders = service.drawerDates(memberNo);
			List<ContentsVO> drawerCards = service.drawerCards(memberNo);
			
			mav.setViewName("contents/drawer_day");
			mav.addObject("drawerHeaders", drawerHeaders);
			mav.addObject("cards", drawerCards);
		}
		
		return mav;
	}
	
	@RequestMapping("/contents/drawer_category.do")
	public ModelAndView selectCategoryList(HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {
			int memberNo = userVO.getNo();
			
			List<SavedHeaderVO> drawerHeaders = service.drawerCategory(memberNo);
			List<ContentsVO> drawerCards = service.drawerCards(memberNo);
			
			mav.setViewName("contents/drawer_category");
			mav.addObject("drawerHeaders", drawerHeaders);
			mav.addObject("cards", drawerCards);
		}
		
		return mav;
	}
	
	@RequestMapping("/contents/drawer_source.do")
	public ModelAndView selectSourceList(HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {
			int memberNo = userVO.getNo();
			
			List<SavedHeaderVO> drawerHeaders = service.drawerSource(memberNo);
			List<ContentsVO> drawerCards = service.drawerCards(memberNo);
			
			mav.setViewName("contents/drawer_source");
			mav.addObject("drawerHeaders", drawerHeaders);
			mav.addObject("cards", drawerCards);
		}
		
		return mav;
	}
	
	@RequestMapping("/contents/drawer_directory.do")
	public ModelAndView selectDirectoryList(HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {
			int memberNo = userVO.getNo();
			
			List<SavedHeaderVO> drawerHeaders = service.drawerDirectory(memberNo);
			List<ContentsVO> drawerCards = service.drawerCards(memberNo);
			
			mav.setViewName("contents/drawer_directory");
			mav.addObject("drawerHeaders", drawerHeaders);
			mav.addObject("cards", drawerCards);
		}
		
		return mav;
	}
	
	/* 큐레이션 */
	@RequestMapping("/contents/curation.do")
	public String curation(Model model) {
		List<ContentsVO> popularList = service.selectPopularList();
		model.addAttribute("popularList", popularList);
		
		return "contents/curation";
	}
	
	/*내 검색어*/
	@RequestMapping("/contents/my_search.do")
	public String my_search(Model model, @RequestParam("memberNo") int memberNo) {
		List<KeywordsVO> keywordList = service.selectKeywordList(memberNo);
		model.addAttribute("keywordList", keywordList);
		
		System.out.println("keywordList controller : " + keywordList);
		
		return "contents/my_search";
	}
	
	@RequestMapping("/contents/update_status.do")
	public String updateStatus(@RequestParam("no") int no, @RequestParam("memberNo") int memberNo) {
		service.updateStatus(no);
		
		return "redirect:/contents/my_search.do?memberNo="+memberNo;
	}
	
	//통계 분석 
	@RequestMapping("/contents/analysis.do")
	public String analysis(Model model, HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int memberNo = userVO.getNo();
		
		List<KeywordsVO> keywordList = service.selectKeywordList(memberNo);
		
		//System.out.println("controller : " + memberNo);
			
		return "contents/analysis";
	}
	
	@RequestMapping("/contents/customizing.do")
	public String customizing(Model model) {
		
		return "contents/customizing";
	}
	
	@RequestMapping("/contents/upgrade.do")
	public String upgrade(Model model) {
		
		return "contents/upgrade";
	}
	
	@RequestMapping("/card_enrollform_modal.do")
	public String cardEnroll(Model model) {
		
		return "contents/card_enrollform_modal";
	}

}
