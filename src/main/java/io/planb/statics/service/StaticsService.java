package io.planb.statics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.keywords.vo.KeywordsVO;
import io.planb.statics.dao.StaticsDAO;
import io.planb.statics.vo.StaticsVO;

@Service
public class StaticsService {
	
	@Autowired
	private StaticsDAO dao;

	public List<StaticsVO> selectSavedSource(int no) {
		List<StaticsVO> staticsList = dao.selectSavedSource(no);
		
		return staticsList;
	}

	public List<StaticsVO> selectSavedSourceType(int no) {
		List<StaticsVO> staticsList = dao.selectSavedSourceType(no);
		
		return staticsList;
	}


	public List<StaticsVO> selectwordCloudList(int memberNo) {
		List<StaticsVO> wordCloudList = dao.selectWordCloudList(memberNo);
		
		return wordCloudList;
	}

	public List<StaticsVO> selectAllUserWordCloudList(StaticsVO columnName) {
		List<StaticsVO> AllWordCloudList = dao.selectAllUserWordCloudList(columnName);
		
		return AllWordCloudList;
	}
	
	public List<StaticsVO> selectAllSavedSource() {
		List<StaticsVO> staticsList = dao.selectAllSavedSource();
		
		return staticsList;
	}

	public List<StaticsVO> selectAllSourceType() {
		List<StaticsVO> staticsList = dao.selectAllSourceType();
		
		return staticsList;
	}

	public List<StaticsVO> selectAllCntContents() {
		List<StaticsVO> contentStaticsList = dao.selectAllCntContents();
		
		
		return contentStaticsList;
	}
	
	public List<StaticsVO> selectCiteContents() {
		List<StaticsVO> citeStaticsList = dao.selectCiteContents();
		
		return citeStaticsList;
	}

	public List<KeywordsVO> selectAllKeywordList() {
		List<KeywordsVO> allKeywordList = dao.selectAllKeywordList();
		return allKeywordList;
	}

	public List<StaticsVO> selectLikeSource(int no) {
		List<StaticsVO> staticsList = dao.selectLikeSource(no);
		
		return staticsList;
	}

	public List<StaticsVO> selectLikeSourceType(int no) {
		List<StaticsVO> staticsList = dao.selectLikeSourceType(no);
		
		return staticsList;
	}

	
	public int countTotalSaved(int no) {
		int countTotalSaved = dao.countTotalSaved(no);	
		
		return countTotalSaved;
	}

	public int countTodaySaved(int no) {
		int countTodaySaved = dao.countTodaySaved(no);
		
		return countTodaySaved;
	}

	public int countYesSaved(int no) {
		int countYesSaved = dao.countYesSaved(no);
		
		return countYesSaved;
	}

	public int countBeforeYesSaved(int no) {
		int countBeforeYesSaved = dao.countBeforeYesSaved(no);
		
		return countBeforeYesSaved;
	}

	public List<StaticsVO> selectSavedMoreSaved(int no) {
		List<StaticsVO> savedMoreSavedList = dao.selectSavedMoreSaved(no);
		
		return savedMoreSavedList;
	}

	public List<StaticsVO> selectSavedLessSaved(int no) {
		List<StaticsVO> savedLessSavedList = dao.selectSavedLessSaved(no);
		
		return savedLessSavedList;
	}

	public List<StaticsVO> selectSavedLike(int no) {
		List<StaticsVO> savedLikeList = dao.selectSavedLike(no);
		
		return savedLikeList;
	}

	public int selectNewUserCnt() {
		int newUserCnt = dao.selectNewUserCnt();
		
		return newUserCnt;
	}
	
	public int selectSerachToday() {
		int serachToday = dao.selectSerachToday();
		
		return serachToday;
	}
	
	public String selectPopularKeyword() {
		String popularKeyword = dao.selectPopularKeyword();
		
		return popularKeyword;
	}

	public int selectSavedContent() {
		int savedContent = dao.selectSavedContent();
		
		return savedContent;
	}
}
