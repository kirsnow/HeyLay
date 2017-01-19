package io.planb.membership.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import io.planb.directory.vo.DirectoryVO;
import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;

@SessionAttributes("memberVO")
@Controller
public class MembershipController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/membership/membership.do", method=RequestMethod.GET)
	public String membershipForm() {
		
		return "membership/membershipform";
	}
	
	@RequestMapping(value="/membership/membershipForm.do", method=RequestMethod.POST)
	public String membership(@ModelAttribute("member") MemberVO member, Model model) {
		System.out.println(member);
		service.enroll(member);
		service.firstFolder();
		model.addAttribute("memberVO", member);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/contents/update_type.do", method=RequestMethod.POST)
	public String updateType(Model model, @RequestParam("no") int no) {
		
		service.updateType(no);
		System.out.println("controller : " + no);
		return "redirect:/";
	}
	
	@RequestMapping("/contents/folder_edit.do")
	public String folderEdit(Model model, @RequestParam("memberNo") int memberNo) {
		List<DirectoryVO> folderList =  service.selectFolder(memberNo);
		model.addAttribute("folderList", folderList);
		
		return "contents/folder_edit";
	}
	
	@ResponseBody
	@RequestMapping(value="/contents/updateName.do", method=RequestMethod.POST)
	public String updateName(@RequestBody Map<Integer, String> params, Model model) {
		
		service.updateName(params);

		return "완료";
	}
}










