package io.planb.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import io.planb.faq.service.FaqServiceImp;
import io.planb.faq.vo.FaqVO;

@RequestMapping("/faq")
@Controller
public class FaqController {
	
	@Autowired
	private FaqServiceImp service;
	
	
	@RequestMapping(value="/faq.do")
	public ModelAndView goToList() {
		
		List<FaqVO> faqLists = service.faqlists();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq/faq_form");
		mav.addObject("faqLists", faqLists);
		return mav;
	}
	
	@RequestMapping(value="/faqDetail.do")
	public ModelAndView goTODetail(HttpServletRequest request) {
		int no = Integer.parseInt(((String)request.getParameter("no") == null ? "1" : (String)request.getParameter("no")));
		FaqVO detail = service.getDetail(no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq/faq_detail");
		mav.addObject("detail", detail);
		return mav;
	}

}

