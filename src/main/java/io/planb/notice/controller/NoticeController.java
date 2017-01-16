package io.planb.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import io.planb.notice.service.NoticeServiceImp;
import io.planb.notice.vo.NoticeVO;

@RequestMapping("/notice")
@Controller
public class NoticeController {

	@Autowired
	private NoticeServiceImp service;
	

	@RequestMapping(value="/list.do")
	public ModelAndView goToList() {
		
		List<NoticeVO> lists = service.getLists();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice_list");
		mav.addObject("lists", lists);
		return mav;
	}
	
	@RequestMapping(value="/detail.do")
	public ModelAndView goTODetail(HttpServletRequest request) {
		int no = Integer.parseInt(((String)request.getParameter("no") == null ? "1" : (String)request.getParameter("no")));
		String prepage = ((String)request.getParameter("prepage") == null ? "none" : (String)request.getParameter("prepage"));
		NoticeVO detail = service.getDetail(no, prepage);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice_detail");
		mav.addObject("detail", detail);
		return mav;
	}
}
