package io.planb.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import io.planb.member.vo.MemberVO;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		DefaultRedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
		
		Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if(user instanceof MemberVO) {
			MemberVO userVO = (MemberVO) user;
			
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			
//			System.out.println("session userVO: " + session.getAttribute("userVO"));
			if(userVO.getType().equals("A")) {
				redirectStrategy.sendRedirect(request, response, "/jsp/admin/member_list.do");
			} else if(userVO.getSelectKeywords() == 0) {
				redirectStrategy.sendRedirect(request, response, "/login/interest.do");
			} else {
//				String redirectUrl = (String) session.getAttribute("prevPage");
////				System.out.println("redirectUrl: " + redirectUrl);
//				
//				
//	            if (redirectUrl != null && ( ! redirectUrl.equals("/login/login.do")) ) {
//	            	String saveUrl = redirectUrl;
//	                session.removeAttribute("prevPage");
//	                redirectStrategy.sendRedirect(request, response, saveUrl);
//	            } else {
	            	redirectStrategy.sendRedirect(request, response, "/contents/curation.do");
			}
		}
		
		
		
	}

}
