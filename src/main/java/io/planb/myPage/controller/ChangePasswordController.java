package io.planb.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;

@RequestMapping("/myPage")
@Controller
public class ChangePasswordController {


		@Autowired
		private MemberService service;
		
		/* 기존 비밀번호 */
		@RequestMapping(value="/passwordChange.do", method=RequestMethod.GET)
		public String orginalPassword() {
			return "myPage/change_password";
		}
		
		@RequestMapping(value="/passwordChange.do", method=RequestMethod.POST)
		public String orginalPasswordForm() {
			
			return "myPage/change_password";
		}
		
		/* 신규 비밀번호 */ 
		@RequestMapping(value="/changePw.do")
		public String newPassword(@RequestParam("beforePassword") String beforePassword, MemberVO member,  Model model) {
			
			/*if(member != null) {
			model.addAttribute("msg", "비밀번호 변경이 완료 하였습니다.");
			} else {
			model.addAttribute("msg2", "비밀번호 변경이 실패하였습니다.");
			}*/
			
			member.setBeforePassword(beforePassword);
			System.out.println(member);
			
			service.changePw(member);
			
			return "myPage/change_password";	
		}
	}
