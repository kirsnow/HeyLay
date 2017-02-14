package io.planb.contents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentDAO;
import io.planb.contents.vo.ContentsVO;
import io.planb.contents.vo.SavedHeaderVO;
import io.planb.contents.vo.SavedVO;
import io.planb.directory.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;

@Service
public class ContentService {

	@Autowired
	private ContentDAO dao;
	
	public List<KeywordsVO> selectKeywordList(int memberNo) {
		List<KeywordsVO> keywordList = dao.selectKeywordList(memberNo);
		return keywordList;
	}
	
	public void updateStatus(KeywordsVO keyword) {
		dao.updateStatus(keyword);
	} 
	
	public List<ContentsVO> drawerCards(int memberNo) {
		List<ContentsVO> drawerCards = dao.drawerCards(memberNo);
		return drawerCards;
	}
	
	public List<SavedHeaderVO> drawerDates(int memberNo) {
		List<SavedHeaderVO> drawerDates = dao.drawerDates(memberNo);
		return drawerDates;
	}
	
	public List<SavedHeaderVO> drawerDirectory(int memberNo) {
		List<SavedHeaderVO> drawerDirectory = dao.drawerDirectory(memberNo);
		return drawerDirectory;
	}
	
	public List<SavedHeaderVO> drawerCategory(int memberNo) {
		List<SavedHeaderVO> drawerCategory = dao.drawerCategory(memberNo);
		return drawerCategory;
	}
	
	public List<SavedHeaderVO> drawerSource(int memberNo) {
		List<SavedHeaderVO> drawerSource = dao.drawerSource(memberNo);
		return drawerSource;
	}
	
	public List<DirectoryVO> directoryList(int userNo) {
		List<DirectoryVO> dirList = dao.directoryList(userNo);
		return dirList;
	}

	public void saveCard(SavedVO card) {
		if(card.getDirectoryNo() < 0) {
			DirectoryVO newDir = new DirectoryVO();
			newDir.setMemberNo(card.getMemberNo());
			newDir.setName(card.getDirectoryName());
			
			int directoryNo = this.newDirectory(newDir);
			card.setDirectoryNo(directoryNo);
		}
		dao.saveCard(card);
	}

	public int newDirectory(DirectoryVO newDir) {
		int dirNo = dao.nextDirNo();
		newDir.setNo(dirNo);
		dao.newDirectory(newDir);
		return dirNo;
	}

}
