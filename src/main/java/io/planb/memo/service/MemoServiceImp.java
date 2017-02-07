package io.planb.memo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.memo.dao.MemoDAOImp;
import io.planb.memo.vo.MemoVO;

@Service
public class MemoServiceImp {
	
	@Autowired
	private MemoDAOImp dao;
	
	public MemoVO addMemo(MemoVO memo) {
		//다음 memoNo 추출
		int nextMemoNo = dao.getNextMemoNo();
		memo.setNo(nextMemoNo);
		
		//DB에 메모 추가
		dao.addMemo(memo);
		
		//추가한 메모 정보
		MemoVO added = getMemo(nextMemoNo);
		return added;
	}
	
	public MemoVO getMemo(int no) {
		MemoVO memo = dao.getMemo(no);
		return memo;
	}
	
	public List<MemoVO> getMemoList(int contentsNo) {
		List<MemoVO> memoList = dao.getMemoList(contentsNo);
		return memoList;
	}
	
	public MemoVO editMemo(MemoVO memo) {
		dao.editMemo(memo);
		MemoVO edited = getMemo(memo.getNo());
		return edited;
	}
	
	public void delMemo(int no) {
		dao.delMemo(no);
	}

}
