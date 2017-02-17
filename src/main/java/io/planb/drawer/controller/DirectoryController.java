package io.planb.drawer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import io.planb.drawer.service.DirectoryService;
import io.planb.drawer.vo.DirectoryVO;
import io.planb.member.vo.MemberVO;

@Controller
public class DirectoryController {
	
	@Autowired
	private DirectoryService service;
	
	@RequestMapping("/directory.do")
	public ModelAndView folderEdit(HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {
			List<DirectoryVO> folderList =  service.selectFolder(userVO.getNo());
			mav.setViewName("drawer/directory");
			mav.addObject("folderList", folderList);
		}
		return mav;
	}
	

	@ResponseBody
	@RequestMapping(value="/contents/updateDir.do", method=RequestMethod.POST)
	public String updateDir(@RequestParam("no") int no, @RequestParam("name") String name) {
		
		DirectoryVO directory = new DirectoryVO();
		directory.setNo(no);
		directory.setName(name);
		
		service.updateDir(directory);
		
		return "완료";
	}
	
	@ResponseBody
	@RequestMapping(value="/contents/addDir.do", method=RequestMethod.POST)
	public String addDir(HttpSession session, @RequestParam("name") String name) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		DirectoryVO directory = new DirectoryVO();
		directory.setMemberNo(userNo);
		directory.setName(name);
		
		service.newDirectory(directory);
		
		return "완료";
	}
	
	@ResponseBody
	@RequestMapping(value="/contents/delDir.do", method=RequestMethod.POST)
	public String delDir(HttpSession session, @RequestParam("no[]") List<Integer> noList) {

		service.delDir(noList);
		
		return "완료";
	}
}
