package io.planb.admin.ad.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import io.planb.ad.vo.AdVO;
import io.planb.admin.ad.service.AdService;

@Controller
public class AdController {
	
	@Autowired
	private AdService service;
	
	@RequestMapping("/jsp/admin/ad_list.do")
	public String selectAdList(Model model) {
		List<AdVO> adList = service.selectAdList();
		model.addAttribute("adList", adList);
		
		return "admin/ad";
	}
	
	@RequestMapping(value = "/jsp/admin/ad_add.do", method = RequestMethod.POST)
	public String insertAd(@ModelAttribute AdVO ad) {
		service.insertAd(ad);
		
		return "redirect:/jsp/admin/ad_list.do";
	}
	
	@RequestMapping(value="/jsp/admin/ad_modify.do", method=RequestMethod.POST)
	public String updateAd(@ModelAttribute AdVO ad) {
		service.updateAd(ad);
		
		return "redirect:/jsp/admin/ad_list.do";
	}
	
	public String deleteAd(@RequestParam("no") int no) {
		service.deleteAd(no);
		
		return "redirect:/jsp/admin/ad_list.do";
	}

}
