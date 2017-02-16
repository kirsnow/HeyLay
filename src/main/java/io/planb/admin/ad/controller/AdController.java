package io.planb.admin.ad.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	/* 광고 수정 */
	@ResponseBody
	@RequestMapping(value="/jsp/admin/ad_modify.do", method=RequestMethod.POST)
	public String updateAd(@RequestParam(value="siteNames[]") List<String> names , @RequestParam(value="codes[]") List<String> codes, 
							@RequestParam(value="lefts[]") List<Integer> lefts) {
		
		ArrayList<String> nameList = new ArrayList<>();
        nameList.addAll(names);
        ArrayList<String> codeList = new ArrayList<>();
        codeList.addAll(codes);
        ArrayList<Integer> leftList = new ArrayList<>();
        leftList.addAll(lefts);
		
		service.updateAd(nameList, codeList, leftList);

		return "완료";
	}
	
	@RequestMapping(value = "/jsp/admin/ad_add.do", method = RequestMethod.POST)
	public String insertAd(@ModelAttribute AdVO ad) {
		service.insertAd(ad);
		
		return "redirect:/jsp/admin/ad_list.do";
	}
	
//	@RequestMapping(value="/jsp/admin/ad_modify.do", method=RequestMethod.POST)
//	public String updateAd(@ModelAttribute AdVO ad) {
//		service.updateAd(ad);
//		
//		return "redirect:/jsp/admin/ad_list.do";
//	}
	
	public String deleteAd(@RequestParam("no") int no) {
		service.deleteAd(no);
		
		return "redirect:/jsp/admin/ad_list.do";
	}

}
