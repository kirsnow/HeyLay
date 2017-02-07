package io.planb.member.dao;

import java.util.List;
import java.util.Map;

import io.planb.directory.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.leaved.vo.LeavedVO;
import io.planb.member.vo.MemberVO;

public interface MemberDAO {

	/*회원 관련 부분*/
	public MemberVO login(MemberVO member); 				//로그인

	public void enroll(MemberVO member); 	    			//회원가입

	public List<MemberVO> selectByNo(MemberVO member); 		//회원정보 호출

	public MemberVO findAccount(MemberVO member); 			//계정 찾기

	public MemberVO findPw(MemberVO member);				//비밀번호 찾기

	public void withdraw(int no);							//회원 탈퇴
	
	public void updateType(int no);							// 멤버 타입 F->P로 업데이트
	
	public void firstFolder();								// 회원 가입시 디폴트 폴더 생성
	
	public List<DirectoryVO> selectFolder(int memberNo);	// 폴더 변경시 폴더 리스트 호출
	
	public void deleteDirectory(int memberNo);				// 폴더 삭제
	
	public void updateName(Map<Integer, String> params);	// 폴더 이름 변경
	
	public void withdrawReason(LeavedVO leaved);			//회원 탈퇴 사유 입력

	public void changePw(MemberVO member);					//비밀번호 변경 

	public void mypageUpdate(MemberVO member);				//회원 정보 수정

	public List<KeywordsVO> selectInterestList();			//선호 키워드 호출
	

}
