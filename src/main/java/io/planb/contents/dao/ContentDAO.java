package io.planb.contents.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;
import io.planb.keywords.vo.KeywordsVO;

@Repository
public class ContentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ContentsVO getContents(ContentsVO vo) {
		ContentsVO contents = sqlSessionTemplate.selectOne("io.planb.dao.ContentDAO.selectContents", vo);
		return contents;
	}
	
	public List<ContentsVO> getCardsList(ContentsVO vo) {
		List<ContentsVO> cards = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectContents", vo);
		return cards;
	}
	
	public List<ContentsVO> getSavedCards(ContentsVO vo) {
		
		List<ContentsVO> savedCards = this.getCardsList(vo);
		return savedCards;
	}
	
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
	
	public void saveCard(ContentsVO card) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.insertCardToSave", card);
	}

	public List<ContentsVO> selectPopularList() {
		List<ContentsVO> popularList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectPopularList");
		
		return popularList;
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
