package io.planb.statics.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.keywords.vo.KeywordsVO;
import io.planb.statics.vo.StaticsVO;

@Repository
public class StaticsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<StaticsVO> selectSavedSource(int no) {
		List<StaticsVO> staticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectSavedSource", no);
		
		return staticsList;
	}

	public List<StaticsVO> selectSavedSourceType(int no) {
		List<StaticsVO> staticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectSavedSourceType", no);
		
		return staticsList;
	}

	public List<StaticsVO> selectWordCloudList(int memberNo) {
		List<StaticsVO> wordCloudList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectWordCloudList", memberNo);
		
		return wordCloudList;
	}
	
	public List<StaticsVO> selectAllUserWordCloudList(StaticsVO columnName) {
		List<StaticsVO> AllWordCloudList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectAllUserWordCloudList", columnName);
		
		return AllWordCloudList;
	}
	
	public List<StaticsVO> selectAllSavedSource() {
		List<StaticsVO> staticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectAllSavedSource");
		
		return staticsList;
	}

	public List<StaticsVO> selectAllSourceType() {
		List<StaticsVO> staticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectAllSourceType");
		
		return staticsList;
	}

	public List<StaticsVO> selectAllCntContents() {
		List<StaticsVO> contentStaticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectAllCntContents");
		
		return contentStaticsList;
	}

	public List<StaticsVO> selectCiteContents() {
		List<StaticsVO> citeStaticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectCiteContents");
		
		return citeStaticsList;
	}

	public List<KeywordsVO> selectAllKeywordList() {
		List<KeywordsVO> allKeywordList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectAllKeywordList");
		
		//System.out.println(allKeywordList);
		
		return allKeywordList;
	}

	public List<StaticsVO> selectLikeSource(int no) {
		List<StaticsVO> staticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectLikeSource", no);
		
		return staticsList;
	}

	public List<StaticsVO> selectLikeSourceType(int no) {
		List<StaticsVO> staticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectLikeSourceType", no);
		
		return staticsList;
	}

	public int countTotalSaved(int no) {
		int countTotalSaved = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.countTotalSaved", no);
		
		return countTotalSaved;
	}

	public int countTodaySaved(int no) {
		int countTodaySaved = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.countTodaySaved", no);
		
		return countTodaySaved;
	}

	public int countYesSaved(int no) {
		int countYesSaved = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.countYesSaved", no);
		
		return countYesSaved;
	}

	public int countBeforeYesSaved(int no) {
		int countBeforeYesSaved = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.countBeforeYesSaved", no);
		
		return countBeforeYesSaved;
	}
	
	public int sumSavedMonth(int no) {
		int sumSavedMonth = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.sumSavedMonth", no);
		
		return sumSavedMonth;
	}

	public List<StaticsVO> selectSavedMoreSaved(int no) {
		List<StaticsVO> savedMoreSavedList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectSavedMoreSaved", no);
		
		return savedMoreSavedList;
	}

	public List<StaticsVO> selectSavedLessSaved(int no) {
		List<StaticsVO> savedLessSavedList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectSavedLessSaved", no);
		
		return savedLessSavedList;
	}

	public List<StaticsVO> selectSavedLike(int no) {
		List<StaticsVO> savedLikeList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectSavedLike", no);
		
		return savedLikeList;
	}

	public List<StaticsVO> selectSavedMonth(int no) {
		List<StaticsVO> staticsList = sqlSessionTemplate.selectList("io.planb.statics.dao.StaticsDAO.selectSavedMonth", no);
		
		return staticsList;
	}
	
	public int selectNewUserCnt() {
		int newUserCnt = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.selectNewUserCnt");
		
		return newUserCnt;
	}
	
	public int selectSerachToday() {
		int serachToday = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.selectSerachToday");
		
		return serachToday;
	}

	public String selectPopularKeyword() {
		String serachToday = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.selectPopularKeyword");
		
		return serachToday;
	}

	public int selectSavedContent() {
		int savedContent = sqlSessionTemplate.selectOne("io.planb.statics.dao.StaticsDAO.selectSavedContent");
		
		return savedContent;
	}
}
