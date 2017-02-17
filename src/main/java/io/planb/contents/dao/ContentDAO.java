package io.planb.contents.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;
import io.planb.drawer.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;

@Repository
public class ContentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ContentsVO> getSavedCards(ContentsVO vo) {
		
		List<ContentsVO> savedCards = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectContents", vo);
		System.out.println("savedCards.size: " + savedCards.size());
		if(savedCards.size() > 0) System.out.println("savedCard no.1: " + savedCards.get(0).toString());
		return savedCards;
	}
	
	public List<KeywordsVO> selectKeywordList(int memberNo) {
		List<KeywordsVO> keywordList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectKeywordList", memberNo);
		
		System.out.println(keywordList);
		System.out.println("DAO : " + memberNo);
		
		return keywordList;
	}
	
	public void updateStatus(KeywordsVO keyword) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.updateStatus", keyword);
	}
	
	public List<ContentsVO> drawerCards(int memberNo) {
		List<ContentsVO> drawerCards = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerCards", memberNo);
		return drawerCards;
	}
	
	public int nextDirNo() {
		int nextDirNo = sqlSessionTemplate.selectOne("io.planb.contents.dao.ContentDAO.selectNextDirNo");
		return nextDirNo;
	}
	
	public List<DirectoryVO> directoryList(int userNo) {
		List<DirectoryVO> dirList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectDirList", userNo);
		return dirList;
	}

	public void newDirectory(DirectoryVO newDir) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.insertDir", newDir);		
	}

	public void saveCard(ContentsVO card) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.insertCardToSave", card);
	}

	public List<ContentsVO> selectPopularList() {
		List<ContentsVO> popularList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectPopularList");
		
		return popularList;
	}
	
	public void updateDir(DirectoryVO dir) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.updateDir", dir);
	}
	
	public void delDir(int no) {
		sqlSessionTemplate.delete("io.planb.contents.dao.ContentDAO.delDir", no);
	}

	public void delDir(List<Integer> noList) {
		sqlSessionTemplate.delete("io.planb.contents.dao.ContentDAO.deleteDirs", noList);
		
	}

	public List<ContentsVO> selectCustomSourceList(int no) {
		List<ContentsVO> customSourceList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectCustomSourceList", no);
		
		return customSourceList;
	}

	public List<KeywordsVO> selectUserKeywordList(int no) {
		List<KeywordsVO> keywordList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectUserKeywordList", no);
		
		return keywordList;
	}

	public List<ContentsVO> selectCustomCuration(String keywords) {
		List<ContentsVO> customKeywordList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectCustomCuration", keywords);
		
		return customKeywordList;
	}

}
