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
		
		System.out.println(allKeywordList);
		
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
}
