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

import io.planb.search.service.SearchServiceImp;
import io.planb.search.vo.SearchVO;

@RequestMapping("/search")
@Controller
public class SearchController {

	@Autowired
	private SearchServiceImp service;
	
	@RequestMapping(value="/result.do", method=RequestMethod.GET)
	public ModelAndView searchResult(HttpServletRequest request) throws JSONException, IOException {
		
		SearchVO searchVO = new SearchVO();
		String searchQuery = (String)request.getParameter("q");
		searchVO.setSearchQuery(searchQuery);
		searchVO.setHostIP((String)request.getParameter("host"));
		
		List<SearchVO> searchResults = service.searchResult(searchVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/search_result");
		mav.addObject("searchQuery", searchQuery);
		mav.addObject("searchResults", searchResults);
		return mav;
	}
	
	@RequestMapping(value="/contents.do", method=RequestMethod.GET)
	public ModelAndView viewContents(@RequestParam int contentsNo) {
		
		SearchVO contents = service.getContents(contentsNo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("");
		return mav;
	}
	
}
