package io.planb.contents.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.planb.contents.service.ContentService;
import io.planb.contents.vo.SavedVO;
import io.planb.member.vo.MemberVO;
import io.planb.memo.service.MemoServiceImp;
import io.planb.memo.vo.MemoVO;

@RequestMapping("/contents/ajax")
@Controller
public class ContentsAjaxController {
	
	@Autowired
	private ContentService service;
	
	@Autowired
	private MemoServiceImp memoService;
	
	@ResponseBody
	@RequestMapping("/save_card.do")
	public String saveCard(HttpSession session
			, @RequestParam int contentsNo, @RequestParam int dirNo
			, @RequestParam String dirName
			, @RequestParam(required=false) String memoMessage) {
		
		System.out.println("contentsNo: " + contentsNo);
		System.out.println("dirNo: " + dirNo);
		System.out.println("dirName: " + dirName);
		System.out.println("memoMessage: " + memoMessage);
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;
		
		SavedVO card = new SavedVO();
		card.setMemberNo(userNo);
		card.setContentsNo(contentsNo);
		card.setDirectoryNo(dirNo);
		card.setDirectoryName(dirName);
		service.saveCard(card);
		
		if(memoMessage != null) {
			MemoVO memo = new MemoVO();
			memo.setMemberNo(userNo);
			memo.setContentsNo(contentsNo);
			memo.setMessage(memoMessage);
			memoService.addMemo(memo);
		}
		
		return "succeed";
	}

}
