package io.planb.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.vo.ContentsVO;
import io.planb.memo.vo.MemoVO;
import io.planb.search.dao.SearchDAOImp;
import io.planb.search.vo.SearchVO;

@Service
public class SearchServiceImp {

	@Autowired
	private SearchDAOImp dao;
	
	public SearchVO searchResult(String q, String ip, int userNo) {
		
		String defaultHostIP = "52.35.61.184";  //Host IP 미설정 시, defaultHostIP에서 검색 실행. "http://hostIP:9200" 형식이 된다.
		String hostIP = ip != null ? ip : defaultHostIP;
		
		//검색 실행
		SearchVO searchResult = dao.searchResult(q, hostIP);
		
		//검색 키워드 저장
		SearchVO keyword = new SearchVO();
		if(searchResult == null) keyword.setTotal(0);
		keyword.setQuery(q);
		keyword.setUserNo(userNo);
		dao.saveKeyword(keyword);
		
		return searchResult;
	}

	public ContentsVO getContents(int contentsNo) {
		ContentsVO contents = dao.getContents(contentsNo);
		return contents;
	}

	public List<MemoVO> getMemo(int no) {
		List<MemoVO> memoList = dao.getMemo(no);
		return memoList;
	}
	
}
