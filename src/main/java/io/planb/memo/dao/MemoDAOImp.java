package io.planb.memo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.memo.vo.MemoVO;

@Repository
public class MemoDAOImp {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addMemo(MemoVO memo) {
		sqlSessionTemplate.insert("io.planb.memo.dao.MemoDAO.insertMemo", memo);
	}

	public int getNextMemoNo() {
		int nextMemoNo = sqlSessionTemplate.selectOne("io.planb.memo.dao.MemoDAO.selectNextMemoNo");
		return nextMemoNo;
	}

	public MemoVO getMemo(int no) {
		MemoVO added = sqlSessionTemplate.selectOne("io.planb.memo.dao.MemoDAO.selectMemoByNo", no);
		return added;
	}

	public List<MemoVO> getMemoList(int contentsNo) {
		List<MemoVO> memoList = sqlSessionTemplate.selectList("io.planb.memo.dao.MemoDAO.selectMemoList", contentsNo);
		return memoList;
	}
	
	public void editMemo(MemoVO memo) {
		sqlSessionTemplate.update("io.planb.memo.dao.MemoDAO.updateMemo", memo);
	}
	
	public void delMemo(int no) {
		sqlSessionTemplate.delete("io.planb.memo.dao.MemoDAO.deleteMemo", no);
	}
}
