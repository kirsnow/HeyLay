package io.planb.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.directory.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.leaved.vo.LeavedVO;
import io.planb.member.vo.IdentifyQuestionVO;
import io.planb.member.vo.MemberVO;
import io.planb.member.vo.SelectKeywordsVO;

@Repository
public class MemberDAOImp implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; 

	
	/*회원 관련 부분*/
	@Override
	public MemberVO login(MemberVO member) {
		MemberVO user = sqlSessionTemplate.selectOne("io.planb.member.dao.MemberDAO.login", member);
		return user;
	}

	@Override
	public void enroll(MemberVO member) {
		sqlSessionTemplate.insert("io.planb.member.dao.MemberDAO.enroll", member);
	}

	@Override
	public List<MemberVO> selectByNo(MemberVO member) {
		List<MemberVO> memberList = sqlSessionTemplate.selectList("io.planb.member.dao.MemberDAO.selectByNo", member);
		return memberList;
	}

	@Override
	public void withdraw(int no) {
		sqlSessionTemplate.update("io.planb.member.dao.MemberDAO.withdraw", no);	
	}
	
	@Override
	public void changePw(MemberVO member) {
		sqlSessionTemplate.update("io.planb.member.dao.MemberDAO.changePw", member);
	}
	
	/*회원정보 수정*/
	@Override
	public void mypageUpdate(MemberVO member) {
		sqlSessionTemplate.update("io.planb.member.dao.MemberDAO.mypageUpdate", member);
		
	}
	
	/*폴더 관련 부분*/
	@Override
	public void updateType(int no) {
		sqlSessionTemplate.update("io.planb.member.dao.MemberDAO.updateType", no);
		System.out.println("DAO : " + no);
	}

	@Override
	public void withdrawReason(LeavedVO leaved) {
		sqlSessionTemplate.insert("io.planb.member.dao.MemberDAO.withdrawReason", leaved);
	}
	
	@Override
	public int getNextMemberNo() {
		int nextMemberNo = sqlSessionTemplate.selectOne("io.planb.member.dao.MemberDAO.selectMemberNo");
		return nextMemberNo;
	}
	
	@Override
	public void firstFolder(int memberNo) {
		sqlSessionTemplate.insert("io.planb.member.dao.MemberDAO.insertFirstFolder", memberNo);
	}

	@Override
	public List<DirectoryVO> selectFolder(int memberNo) {
		List<DirectoryVO> folderList = sqlSessionTemplate.selectList("io.planb.member.dao.MemberDAO.selectFolder", memberNo);
		return folderList;
	}

	@Override
	public void deleteDirectory(int memberNo) {
		sqlSessionTemplate.delete("io.planb.member.dao.MemberDAO.deleteDirectory", memberNo);
	}

	@Override
	public void updateName(Map<Integer, String> params) {
		sqlSessionTemplate.update("io.planb.member.dao.MemberDAO.updateName", params);
		
	}
	
	/*선호 키워드 호출*/
	public List<KeywordsVO> selectInterestList() {
		List<KeywordsVO> interestKeywordList = sqlSessionTemplate.selectList("io.planb.member.dao.MemberDAO.selectInterestList");
		
		return interestKeywordList;
	}
	
	/*계정&비밀번호 찾기용 질문*/
	@Override
	public List<IdentifyQuestionVO> selectIdenQuestion() {
		List<IdentifyQuestionVO> idenQuestionList = sqlSessionTemplate.selectList("io.planb.member.dao.MemberDAO.selectIdenQuestion");
		
		return idenQuestionList;
	}

	@Override
	public void insertKeywords(SelectKeywordsVO keywords) {
		sqlSessionTemplate.insert("io.planb.member.dao.MemberDAO.insertKeywords", keywords);
	}
	
	//회원 탈퇴 시 보유 컨텐츠 호출
	@Override
	public int selectWithdrawContentCnt(int memberNo) {
		int withdrawContentCnt = sqlSessionTemplate.selectOne("io.planb.member.dao.MemberDAO.selectWithdrawContentCnt", memberNo);
		
		return withdrawContentCnt;
	}
	
	//계정 찾기
	@Override
	public String selectMemberAccount(MemberVO member) {
		String userAccount = sqlSessionTemplate.selectOne("io.planb.member.dao.MemberDAO.selectMemberAccount", member);
		return userAccount;
	}
	
	//비밀번호 찾기
	@Override
	public String selectMemberPassword(MemberVO member) {
		String userPassword = sqlSessionTemplate.selectOne("io.planb.member.dao.MemberDAO.selectMemberPassword", member);
		return userPassword;
	}
}
