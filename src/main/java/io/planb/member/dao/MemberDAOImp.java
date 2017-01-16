 package io.planb.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.directory.vo.DirectoryVO;
import io.planb.leaved.vo.LeavedVO;
import io.planb.member.vo.MemberVO;

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
	public MemberVO findAccount(MemberVO member) {
		MemberVO userAccount = sqlSessionTemplate.selectOne("io.planb.member.dao.MemberDAO.findAccount", member);
		return userAccount;
	}

	@Override
	public MemberVO findPw(MemberVO member) {
		MemberVO userPW = sqlSessionTemplate.selectOne("io.planb.member.dao.MemberDAO.findPw", member);
		return userPW;
	}

	@Override
	public void withdraw(int no) {
		sqlSessionTemplate.update("io.planb.member.dao.MemberDAO.withdraw", no);	
	}
	
	@Override
	public void changePw(MemberVO member) {
		sqlSessionTemplate.update("io.planb.member.dao.MemberDAO.changePw", member);
	}

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
	public void firstFolder() {
		sqlSessionTemplate.insert("io.planb.member.dao.MemberDAO.insertFirstFolder");
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


}
