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

import io.planb.contents.vo.ContentsListVO;
import io.planb.contents.vo.ContentsVO;
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
	
	@RequestMapping(value="/result.do", method=RequestMethod.GET)
	public ModelAndView searchResult(HttpSession session, @RequestParam(required=false) String q, @RequestParam(required=false) String ip) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		SearchVO searchResult = null;
		int userNo = userVO != null ? userVO.getNo() : 0;
		if(q != null) searchResult = service.searchResult(q, ip, userNo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/search_result");
		mav.addObject("searchQuery", q);
		mav.addObject("searchResult", searchResult);
		return mav;
	}
	
	@RequestMapping(value="/contents.do", method=RequestMethod.GET)
	public ModelAndView viewContents(@RequestParam int no, @RequestParam(required=false) String q) {
		
		ContentsVO contents = service.getContents(no, q);
		List<MemoVO> memoList = memoService.getMemoList(no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/contents_detail");
		mav.addObject("contents", contents);
		mav.addObject("memoList", memoList);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/saveCard.do", method=RequestMethod.POST)
	public ContentsListVO getContents(HttpSession session, @RequestParam("param") int param) {
		
//		ContentsVO contents = (ContentsVO)session.getAttribute("contentsVO");
//		int no = contents.getNo();
		
		List<ContentsVO> contentsList = service.getContentsList(param);
		
		return new ContentsListVO(contentsList);
	}
	
}
