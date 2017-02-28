package io.planb.security;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import io.planb.member.service.MemberService;
import io.planb.member.vo.MemberVO;

//@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	private MemberService service;

	/* spring-security 인증된 사용자인지 확인 (로그인 대체용) */
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) authentication;

		UserDetails userVO = service.loadUserByUsername(auth.getName());
		
//		System.out.println("CustomAuthenticationProvider userVO: " + userVO);
		
		// member.getEmail()이랑 email 일치하는 userVO가 없으면
		if(userVO == null) throw new UsernameNotFoundException(auth.getName());
		
		MemberVO member = (MemberVO) userVO;

		// member.getPassword()랑 userVO.getPassword가 일치하지 않으면
		if(! userVO.getPassword().equals(auth.getCredentials())) throw new BadCredentialsException("잘못된 비밀번호입니다. 다시 시도하세요.");
		
		service.updateDate(member);
		Collection<? extends GrantedAuthority> authorities = userVO.getAuthorities();
		
		return new UsernamePasswordAuthenticationToken(userVO, null, authorities);
	}

	/* spring-security 인증 처리 */
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
