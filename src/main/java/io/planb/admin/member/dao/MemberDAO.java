package io.planb.admin.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.leaved.vo.LeavedVO;
import io.planb.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MemberVO> selectMemberList() {
		List<MemberVO> memberList = sqlSessionTemplate.selectList("io.planb.admin.member.dao.MemberDAO.selectMemberList");
		return memberList;
	}

	public int countMember() {
		int memberCnt = sqlSessionTemplate.selectOne("io.planb.admin.member.dao.MemberDAO.countMember");
		return memberCnt;
	}

	public List<LeavedVO> selectWithdraw() {
		List<LeavedVO> withdrawList = sqlSessionTemplate.selectList("io.planb.admin.member.dao.MemberDAO.selectWithdraw");
		return withdrawList;
	}

	public void withdrawMember(int no) {
		sqlSessionTemplate.delete("io.planb.admin.member.dao.MemberDAO.withdrawMember", no);
	}

	public List<MemberVO> selectByOption(String option) {
		List<MemberVO> memberList = sqlSessionTemplate.selectList("io.planb.admin.member.dao.MemberDAO.selectByOption", option);
		return memberList;
	}
	
	public int countByOption(String option) {
		int memberCnt = sqlSessionTemplate.selectOne("io.planb.admin.member.dao.MemberDAO.countByOption", option);
		return memberCnt;
	}

	public List<MemberVO> selectRest() {
		List<MemberVO> memberList = sqlSessionTemplate.selectList("io.planb.admin.member.dao.MemberDAO.selectRest");
		return memberList;
	}
	
	public int countRest() {
		int memberCnt = sqlSessionTemplate.selectOne("io.planb.admin.member.dao.MemberDAO.countRest");
		return memberCnt;
	}

	public List<MemberVO> selectBan() {
		List<MemberVO> memberList = sqlSessionTemplate.selectList("io.planb.admin.member.dao.MemberDAO.selectBan");
		return memberList;
	}
	
	public int countBan() {
		int memberCnt = sqlSessionTemplate.selectOne("io.planb.admin.member.dao.MemberDAO.countBan");
		return memberCnt;
	}

	public void updateType(MemberVO member) {
		sqlSessionTemplate.update("io.planb.admin.member.dao.MemberDAO.updateType", member);
	}

	public MemberVO selectByNo(int no) {
		MemberVO member = sqlSessionTemplate.selectOne("io.planb.admin.member.dao.MemberDAO.selectByNo", no);
		return member;
	}

	public void updateRest(MemberVO member) {
		sqlSessionTemplate.update("io.planb.admin.member.dao.MemberDAO.updateRest", member);
	}

	public void updateBan(MemberVO member) {
		sqlSessionTemplate.update("io.planb.admin.member.dao.MemberDAO.updateBan", member);
	}

	public void deleteReason(Integer no) {
		sqlSessionTemplate.delete("io.planb.admin.member.dao.MemberDAO.deleteReason", no);
	}

}
