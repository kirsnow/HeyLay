package io.planb.memo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.planb.member.vo.MemberVO;
import io.planb.memo.service.MemoServiceImp;
import io.planb.memo.vo.MemoVO;

@RequestMapping("/memo/ajax")
@Controller
public class MemoAjaxController {
		
	@Autowired
	private MemoServiceImp service;
	
	
	@ResponseBody
	@RequestMapping(value="/addMemo.do", method=RequestMethod.POST)
	public MemoVO addMemo(HttpSession session, @RequestParam int contentsNo, @RequestParam String memoMessage) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		MemoVO added = service.addMemo(userNo, contentsNo, memoMessage);
		
		return added;
	}
	
	@ResponseBody
	@RequestMapping(value="/editMemo.do", method=RequestMethod.POST)
	public MemoVO editMemo(HttpSession session, @RequestParam int memoNo, @RequestParam String memoMessage){
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		MemoVO edited = null;
		
		if(userVO != null) {
			MemoVO memo = new MemoVO();
			memo.setNo(memoNo);
			memo.setMessage(memoMessage);
			
			edited = service.editMemo(memo);
		}
		
		return edited;
	};
	
	@ResponseBody
	@RequestMapping(value="/delMemo.do", method=RequestMethod.POST)
	public int delMemo(HttpSession session, @RequestParam String memoNo) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int no = Integer.parseInt(memoNo);
		
		if(userVO != null) {
			service.delMemo(no);
		}
		
		return no;
	}
}
