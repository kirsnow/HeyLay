package io.planb.drawer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.vo.ContentsVO;
import io.planb.drawer.service.DrawerService;
import io.planb.drawer.vo.DrawerVO;
import io.planb.member.vo.MemberVO;
import io.planb.memo.service.MemoServiceImp;

@Controller
public class DrawerController {
	
	@Autowired
	private DrawerService service;
	
	@Autowired
	private MemoServiceImp memoService;
	
	@RequestMapping("/drawer.do")
	public ModelAndView selectSavedByDays(HttpSession session, @RequestParam(required=false) String sort) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		ModelAndView mav = new ModelAndView();
		
		if(userVO == null) {
			mav.setViewName("redirect:/login/login.do");
		} else {
			int memberNo = userVO.getNo();
			System.out.println("memberNo: " + memberNo);
			
			List<DrawerVO> cardsByDays = service.getDrawerList(memberNo, sort);
			
			mav.setViewName("drawer/drawer");
			mav.addObject("cardsByDays", cardsByDays);
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/drawer/ajax/save.do")
	public String saveCard(HttpSession session
			, @RequestParam int contentsNo, @RequestParam int dirNo
			, @RequestParam String dirName
			, @RequestParam(required=false) String memoMessage) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		String result = null;
		
		if(userVO == null) {
			result = "msg: 로그인 후, 카드를 저장할 수 있습니다.";
		} else {
			ContentsVO card = new ContentsVO();
			card.setMemberNo(userNo);
			card.setContentsNo(contentsNo);
			card.setDirectoryNo(dirNo);
			card.setDirectoryName(dirName);
			
			service.saveCard(card);
			
			if(memoMessage != null && !memoMessage.equals("")) {
				result = memoService.addMemoAjax(userNo, contentsNo, memoMessage);
			}
		}
		return result;
	}
	
}
