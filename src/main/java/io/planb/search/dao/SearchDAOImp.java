package io.planb.search.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;
import io.planb.memo.vo.MemoVO;
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
	
	public void saveKeyword(SearchVO searchResult) {
		sqlSessionTemplate.insert("io.planb.serach.dao.SearchDAO.insertKeyword", searchResult);
	}

	public ContentsVO getContents(int contentsNo) {
		
		ContentsVO contents = sqlSessionTemplate.selectOne("io.planb.serach.dao.SearchDAO.selectContentsByNo", contentsNo);
		return contents;
	}
	
	public List<ContentsVO> getContentsList(int contentsNo) {
		List<ContentsVO> contentsList = sqlSessionTemplate.selectOne("io.planb.serach.dao.SearchDAO.selectContentsByNo", contentsNo);
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
	
}
