package io.planb.admin.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.admin.member.dao.MemberDAO;
import io.planb.leaved.vo.LeavedVO;
import io.planb.member.vo.IdentifyQuestionVO;
import io.planb.member.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;

	public List<MemberVO> selectMemberList() {
		List<MemberVO> memberList = dao.selectMemberList();
		return memberList;
	}

	public int countMember() {
		int memberCnt = dao.countMember();
		return memberCnt;
	}

	public List<LeavedVO> selectWithdraw() {
		List<LeavedVO> withdrawList = dao.selectWithdraw();
		return withdrawList;
	}

	public void withdrawMember(ArrayList<Integer> list) {
		for(Integer no : list) {
			dao.withdrawMember(no);
		}
	}

	public List<MemberVO> selectByOption(String option) {
		List<MemberVO> memberList = new ArrayList<>();
		
		switch(option) {
			case "all" :
				memberList = dao.selectMemberList();
				break;
			case "F" :
			case "P" :
				memberList = dao.selectByOption(option);
				break;
			case "rest" :
				memberList = dao.selectRest();
				break;
			case "ban" :
				memberList = dao.selectBan();
				break;
		}
		return memberList;
	}
	
	public int countMember(String option) {
		int memberCnt = 0;
		
		switch(option) {
			case "all" :
				memberCnt = dao.countMember();
				break;
			case "F" :
			case "P" :
				memberCnt = dao.countByOption(option);
				break;
			case "rest" :
				memberCnt = dao.countRest();
				break;
			case "ban" :
				memberCnt = dao.countBan();
				break;
		}
		return memberCnt;
		
	}

	public void updateType(ArrayList<Integer> list, String type) {
		for(Integer no : list) {
			
			MemberVO member = new MemberVO();
			
			member.setNo(no);
			member.setType(type);
			
			dao.updateType(member);
		}
	}

	public void updateRest(ArrayList<Integer> list) {
		for(Integer no : list) {
			
			MemberVO member = dao.selectByNo(no);
			
			switch (member.getRest()) {
				case "Y":
					member.setRest("N");
					break;
				case "N":
					member.setRest("Y");
					break;
			}
			
			dao.updateRest(member);
		}
	}

	public void updateBan(ArrayList<Integer> list) {
		for(Integer no : list) {
			MemberVO member = dao.selectByNo(no);
			
			switch (member.getBan()) {
				case "Y":
					member.setBan("N");
					break;
				case "N":
					member.setBan("Y");
					break;
			}
			
			dao.updateBan(member);
		}
	}

	public void deleteReason(ArrayList<Integer> list) {
		for(Integer no : list) {
			dao.deleteReason(no);
		}
	}

	public MemberVO selectUserInfo(int no) {
		MemberVO userVO = dao.selectUserInfo(no);
		
		return userVO;
	}

	public void updateUser(MemberVO member) {
		dao.updateUser(member);
	}

	public List<IdentifyQuestionVO> selectIdenQuestion() {
		List<IdentifyQuestionVO> idenQuestionList = dao.selectIdenQuestion();
		
		return idenQuestionList;
	}

}
