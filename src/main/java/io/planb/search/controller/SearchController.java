package io.planb.search.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

<<<<<<< HEAD
import io.planb.contents.vo.ContentsListVO;
import io.planb.contents.vo.ContentsVO;
=======
import io.planb.contents.service.ContentService;
import io.planb.contents.vo.ContentsVO;
import io.planb.directory.vo.DirectoryVO;
>>>>>>> 188601bf436cc729ab50726ff0733494241b9f89
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
<<<<<<< HEAD
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajax/saveCard.do", method=RequestMethod.GET)
	public ContentsListVO getContents(HttpSession session, @RequestParam("param") int param) {
		
//		ContentsVO contents = (ContentsVO)session.getAttribute("contentsVO");
//		int no = contents.getNo();
		System.out.println("오니 안 오니 데이터 어디갔니");
=======
>>>>>>> 188601bf436cc729ab50726ff0733494241b9f89
		
		if(userVO != null) {
			List<DirectoryVO> dirList = contentService.directoryList(userNo);
			mav.addObject("dirList", dirList);
		}
		
		return mav;
	}
	
}
