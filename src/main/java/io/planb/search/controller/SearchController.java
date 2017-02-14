package io.planb.search.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.vo.ContentsVO;
import io.planb.contents.service.ContentService;
import io.planb.directory.vo.DirectoryVO;
import io.planb.member.vo.MemberVO;
import io.planb.memo.service.MemoServiceImp;
import io.planb.memo.vo.MemoVO;
import io.planb.search.service.SearchServiceImp;
import io.planb.search.vo.SearchVO;

@RequestMapping("/search")
@Controller
public class SearchController {

	@Autowired
	private SearchServiceImp service;
	
	@Autowired
	private MemoServiceImp memoService;
	
	@Autowired
	private ContentService contentService;
	
	@RequestMapping(value="/result.do", method=RequestMethod.GET)
	public ModelAndView searchResult(HttpSession session, @RequestParam(required=false) String q, @RequestParam(required=false) String ip) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		SearchVO searchResult = null;
		if(q != null) searchResult = service.searchResult(q, ip, userNo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/search_result");
		mav.addObject("searchQuery", q);
		mav.addObject("searchResult", searchResult);
		
		if(userVO != null) {
			List<DirectoryVO> dirList = contentService.directoryList(userNo);
			mav.addObject("dirList", dirList);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/contents.do", method=RequestMethod.GET)
	public ModelAndView viewContents(HttpSession session, @RequestParam int no, @RequestParam(required=false) String q) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		ContentsVO contents = service.getContents(no, q);
		List<MemoVO> memoList = memoService.getMemoList(no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/contents_detail");
		mav.addObject("contents", contents);
		mav.addObject("memoList", memoList);
		return mav;
	}
	
}
