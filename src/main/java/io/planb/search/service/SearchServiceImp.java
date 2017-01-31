package io.planb.search.service;

import java.io.IOException;
import java.util.List;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.search.dao.SearchDAOImp;
import io.planb.search.vo.SearchVO;

@Service
public class SearchServiceImp {

	@Autowired
	private SearchDAOImp dao;
	
	public List<SearchVO> searchResult(SearchVO searchVO) throws JSONException, IOException {
		
		String defaultHostIP = "http://54.244.108.159"; //Host IP 미설정 시, defaultHostIP에서 검색 실행
														//Host IP 뒤에 포트가 붙어 "http://54.244.108.159:9200" 형식이 된다.
		if(searchVO.getHostIP() == null) {
			searchVO.setHostIP(defaultHostIP);
		}
		
		System.out.println("Search Query: " + searchVO.getSearchQuery() + "\nHost IP: " + searchVO.getHostIP());
		List<SearchVO> searchResults = dao.searchResult(searchVO);
		
		return searchResults;
	}

	public SearchVO getContents(int contentsNo) {
		SearchVO contents = dao.getContents(contentsNo);
		return contents;
	}
	
}
