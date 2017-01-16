package io.planb.admin.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.planb.admin.member.service.MemberService;
import io.planb.leaved.vo.LeavedVO;
import io.planb.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	/* 선택한 option 해당 회원 목록 조회 */
	@RequestMapping("/jsp/admin/member_list.do")
	public String selectByOption(@RequestParam("option") String option, Model model) {
//		System.out.println("option : " + option);
		
		List<MemberVO> memberList = service.selectByOption(option);
		model.addAttribute("memberList", memberList);
		
		int memberCnt = service.countMember(option);
		model.addAttribute("memberCnt", memberCnt);
		
		model.addAttribute("option", option);
		
		return "admin/member";
	}
	
	/* 회원 타입 수정 */
	@ResponseBody
	@RequestMapping(value="/jsp/admin/member_modify_type.do", method=RequestMethod.POST)
	public String updateType(@RequestParam(value="checkboxValues[]") List<Integer> param, @RequestParam(value="selectedValue") String type) {
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
		
		service.updateType(list, type);

		return "완료";
	}
	
	/* 휴면 계정 설정, 해제  */
	@ResponseBody
	@RequestMapping(value="/jsp/admin/member_modify_rest.do", method=RequestMethod.POST)
	public String updateRest(@RequestParam(value="checkboxValues[]") List<Integer> param) {
//		System.out.println(param);
		
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
//        messageService.delete(list);
//        return "redirect:/message/list";
		
        service.updateRest(list);
        
        return "완료";
	}
	
	/* 활동 중지 설정, 해제 */
	@ResponseBody
	@RequestMapping(value="/jsp/admin/member_modify_ban.do", method=RequestMethod.POST)
	public String updateBan(@RequestParam(value="checkboxValues[]") List<Integer> param, Model model) {
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
		
		service.updateBan(list);
		
		return "완료";
	}
	
	/* 강제 탈퇴 */
	@ResponseBody
	@RequestMapping("/jsp/admin/member_delete.do")
	public String withdrawMember(@RequestParam(value="checkboxValues[]") List<Integer> param) {
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
		
		service.withdrawMember(list);
		
		return "완료";
	}
	
	/* 탈퇴 사유 조회 */
	@RequestMapping("/jsp/admin/withdraw.do")
	public String selectWithdraw(Model model) {
		List<LeavedVO> withdrawList = service.selectWithdraw();
		model.addAttribute("withdrawList", withdrawList);
		
		return "admin/withdraw";
	}
	
	/* 탈퇴 사유 삭제 */
	@ResponseBody
	@RequestMapping("/jsp/admin/delete_reason.do")
	public String deleteReason(@RequestParam(value="checkboxValues[]") List<Integer> param) {
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
		
		service.deleteReason(list);
		
		return "완료";
	}

}
