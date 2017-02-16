package io.planb.contents.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.service.ContentService;
import io.planb.contents.vo.ContentsVO;
import io.planb.contents.vo.SavedHeaderVO;
import io.planb.contents.vo.SavedVO;
import io.planb.directory.vo.DirectoryVO;
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
	public String curation(Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		
		// 전체 유저가 많이 본 콘텐츠 top 3
 		List<ContentsVO> popularList = service.selectPopularList();
 		model.addAttribute("popularList", popularList);
 		
		// 내가 제일 많이 담은 사이트의 콘텐츠 중 전체 유저가 많이 본 콘텐츠 top 3
		List<ContentsVO> customSourceList = service.selectCustomSourceList(member.getNo());
		model.addAttribute("customSourceList", customSourceList);
		
		// 관심 키워드 & 검색 키워드 해당 콘텐츠 중 전체 유저가 많이 본 콘텐츠 top 3
		List<ContentsVO> customKeywordList = service.selectCustomKeywordList(member.getNo());
		model.addAttribute("customKeywordList", customKeywordList);
		
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
	public String updateStatus(HttpSession session, @RequestParam("no") int no) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		KeywordsVO keywords = new KeywordsVO();
		keywords.setMemberNo(userNo);
		keywords.setNo(no);
		
		service.updateStatus(keywords);
		
		return "redirect:/contents/my_search.do?memberNo="+userNo;
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
	
	@RequestMapping("/contents/card_enrollform_modal.do")
	public String cardEnroll(Model model) {
		
		return "contents/card_enrollform_modal";
	}
	
	@ResponseBody
	@RequestMapping(value="/contents/updateDir.do", method=RequestMethod.POST)
	public String updateDir(@RequestParam("no") int no, @RequestParam("name") String name) {
		
		DirectoryVO directory = new DirectoryVO();
		directory.setNo(no);
		directory.setName(name);
		
		service.updateDir(directory);
		
		return "완료";
	}
	
	@ResponseBody
	@RequestMapping(value="/contents/addDir.do", method=RequestMethod.POST)
	public String addDir(HttpSession session, @RequestParam("name") String name) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		DirectoryVO directory = new DirectoryVO();
		directory.setMemberNo(userNo);
		directory.setName(name);
		
		service.newDirectory(directory);
		
		return "완료";
	}
	
	@ResponseBody
	@RequestMapping(value="/contents/delDir.do", method=RequestMethod.POST)
	public String delDir(HttpSession session, @RequestParam("no[]") List<Integer> noList) {

		service.delDir(noList);
		
		return "완료";
	}

}
