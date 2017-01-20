package io.planb.admin.contents.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.bug.vo.BugVO;
import io.planb.bugAttach.vo.BugAttachVO;
import io.planb.source.vo.SourceVO;

@Repository
public class ContentsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<SourceVO> selectSourceList() {
		List<SourceVO> sourceList = sqlSessionTemplate.selectList("io.planb.admin.contents.dao.ContentsDAO.selectSourceList");
		
		return sourceList;
	}
	
	public int countSource() {
		int sourceCnt = sqlSessionTemplate.selectOne("io.planb.admin.contents.dao.ContentsDAO.countSource");
		
		return sourceCnt;
	}

	public List<SourceVO> selectByOption(int option) {
		List<SourceVO> sourceList = sqlSessionTemplate.selectList("io.planb.admin.contents.dao.ContentsDAO.selectByOption", option);
		
		return sourceList;
	} 

	public void insertSource(SourceVO source) {
		sqlSessionTemplate.insert("io.planb.admin.contents.dao.ContentsDAO.insertSource", source);
	}
	
	public void updateSource(SourceVO source) {
		sqlSessionTemplate.update("io.planb.admin.contents.dao.ContentsDAO.updateSource", source);
	}

	public void deleteSource(int no) {
		sqlSessionTemplate.delete("io.planb.admin.contents.dao.ContentsDAO.deleteSource", no);
	}

	public List<BugVO> selectBugList() {
		List<BugVO> bugList = sqlSessionTemplate.selectList("io.planb.admin.contents.dao.ContentsDAO.selectBugList");
		
		return bugList;
	}

	public List<BugAttachVO> selectBugAttachList() {
		List<BugAttachVO> bugAttachList = sqlSessionTemplate.selectList("io.planb.admin.contents.dao.ContentsDAO.selectBugAttachList");
		
		return bugAttachList;
	}

	public BugVO selectBugDetail(int no) {
		BugVO bug = sqlSessionTemplate.selectOne("io.planb.admin.contents.dao.ContentsDAO.selectBugDetail", no);
		
		return bug;
	}

	public BugAttachVO selectBugAttachDetail(int no) {
		BugAttachVO bugAttach = sqlSessionTemplate.selectOne("io.planb.admin.contents.dao.ContentsDAO.selectBugAttachDetail", no);
		
		return bugAttach;
	}

	public void deleteBug(int no) {
		sqlSessionTemplate.delete("io.planb.admin.contents.dao.ContentsDAO.deleteBug", no);
	}

	public int countByOption(int option) {
		int sourceCnt = sqlSessionTemplate.selectOne("io.planb.admin.contents.dao.ContentsDAO.countByOption", option);
		
		return sourceCnt;
	}

}
