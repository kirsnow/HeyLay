package io.planb.contents.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;
import io.planb.contents.vo.DrawerHeaderVO;
import io.planb.contents.vo.SavedVO;
import io.planb.directory.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;

@Repository
public class ContentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<KeywordsVO> selectKeywordList(int memberNo) {
		List<KeywordsVO> keywordList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectKeywordList", memberNo);
		
		//System.out.println(keywordList);
		//System.out.println("DAO : " + memberNo);
		
		return keywordList;
	}
	
	public void updateStatus(KeywordsVO keyword) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.updateStatus", keyword);
	}
	
	public List<ContentsVO> drawerCards(int memberNo) {
		List<ContentsVO> drawerCards = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerCards", memberNo);
		return drawerCards;
	}
	
	public List<DrawerHeaderVO> drawerDates(int memberNo) {
		List<DrawerHeaderVO> drawerDates = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerDates", memberNo);
		return drawerDates;
	}
	
	public List<DrawerHeaderVO> drawerDirectory(int memberNo) {
		List<DrawerHeaderVO> drawerDirectory = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerDirectory", memberNo);
		return drawerDirectory;
	}
	
	public List<DrawerHeaderVO> drawerCategory(int memberNo) {
		List<DrawerHeaderVO> drawerCategory = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerCategory", memberNo);
		return drawerCategory;
	}
	
	public List<DrawerHeaderVO> drawerSource(int memberNo) {
		List<DrawerHeaderVO> drawerSource = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerSource", memberNo);
		return drawerSource;
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

	public void saveCard(SavedVO card) {
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
