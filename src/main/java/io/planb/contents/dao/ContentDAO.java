package io.planb.contents.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.SavedHeaderVO;
import io.planb.contents.vo.SavedVO;
import io.planb.keywords.vo.KeywordsVO;

@Repository
public class ContentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<KeywordsVO> selectKeywordList(int memberNo) {
		List<KeywordsVO> keywordList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectKeywordList", memberNo);
		
		System.out.println(keywordList);
		System.out.println("DAO : " + memberNo);
		
		return keywordList;
	}
	
	public void updateStatus(int no) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.updateStatus", no);
	}
	
	public List<SavedVO> drawerCards(int memberNo) {
		List<SavedVO> drawerCards = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerCards", memberNo);
		return drawerCards;
	}
	
	public List<SavedHeaderVO> drawerDates(int memberNo) {
		List<SavedHeaderVO> drawerDates = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerDates", memberNo);
		return drawerDates;
	}
	
	public List<SavedHeaderVO> drawerDirectory(int memberNo) {
		List<SavedHeaderVO> drawerDirectory = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerDirectory", memberNo);
		return drawerDirectory;
	}
	
	public List<SavedHeaderVO> drawerCategory(int memberNo) {
		List<SavedHeaderVO> drawerCategory = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerCategory", memberNo);
		return drawerCategory;
	}
	
	public List<SavedHeaderVO> drawerSource(int memberNo) {
		List<SavedHeaderVO> drawerSource = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerSource", memberNo);
		return drawerSource;
	}

}
