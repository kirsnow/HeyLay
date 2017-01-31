package io.planb.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.vo.ContentsVO;
import io.planb.memo.vo.MemoVO;
import io.planb.search.service.SearchServiceImp;
import io.planb.search.vo.SearchVO;

@RequestMapping("/search")
@Controller
public class SearchController {

	@Autowired
	private SearchServiceImp service;
	
	@RequestMapping(value="/result.do", method=RequestMethod.GET)
	public ModelAndView searchResult(HttpServletRequest request, @RequestParam(required=false) String q, @RequestParam(required=false) String host) throws JSONException, IOException {
		
		SearchVO searchResult = null;
		if(q != null) searchResult = service.searchResult(q, host);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/search_result");
		mav.addObject("searchQuery", q);
		mav.addObject("searchResult", searchResult);
		return mav;
	}
	
	@RequestMapping(value="/contents.do", method=RequestMethod.GET)
	public ModelAndView viewContents(@RequestParam int no) {
		
		ContentsVO contents = service.getContents(no);
		List<MemoVO> memoList = service.getMemo(no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/contents_detail");
		mav.addObject("contents", contents);
		mav.addObject("memoList", memoList);
		return mav;
	}
	
}
