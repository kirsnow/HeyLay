package io.planb.search.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.ad.vo.AdVO;
import io.planb.contents.vo.ContentsVO;
import io.planb.memo.vo.MemoVO;
import io.planb.search.tool.Elasitcsearch;
import io.planb.search.tool.Tokenizer;
import io.planb.search.vo.QueryVO;
import io.planb.search.vo.SearchVO;

@Repository
public class SearchDAOImp {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SearchVO searchResult(String q, String ip) {
		
		Elasitcsearch es = new Elasitcsearch();
		SearchVO searchResult = es.searchURI(q, ip);
		return searchResult;
	}
	
	public List<QueryVO> analyzeQuery(String q) {
		Tokenizer tokenizer = new Tokenizer();
		List<QueryVO> queryList = tokenizer.analyzeQuery(q);
		return queryList;
	}
	
	public void saveKeyword(SearchVO searchResult) {
		sqlSessionTemplate.insert("io.planb.serach.dao.SearchDAO.insertKeyword", searchResult);
	}

	public ContentsVO getContents(int contentsNo) {
		
		ContentsVO contents = sqlSessionTemplate.selectOne("io.planb.serach.dao.SearchDAO.selectContentsByNo", contentsNo);
		return contents;
	}
	
	public List<ContentsVO> getContentsList(int contentsNo) {
		List<ContentsVO> contentsList = sqlSessionTemplate.selectList("io.planb.serach.dao.SearchDAO.selectContentsByNo", contentsNo);
		return contentsList;
	}
	
	public ContentsVO getContentsAll() {
		
		ContentsVO contentsA = sqlSessionTemplate.selectOne("io.planb.serach.dao.SearchDAO.selectContentsAll");
		return contentsA;
	}

	public List<MemoVO> getMemo(int contentsNo) {
		List<MemoVO> memoList = sqlSessionTemplate.selectList("io.planb.serach.dao.SearchDAO.selectMemoByNo", contentsNo);
		return memoList;
	}

	public List<AdVO> getAdList() {
		List<AdVO> adList = sqlSessionTemplate.selectList("io.planb.admin.ad.dao.AdDAO.selectAdList");
		return adList;
	}
	
}
