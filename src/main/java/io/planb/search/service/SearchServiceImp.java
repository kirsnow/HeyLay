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
		
		String defaultHostIP = "http://192.168.1.4";
		
		//Host IP가 미설정된 경우, Default로 "http://192.168.1.4"를 입력한다.
		if(searchVO.getHostIP() == null) {
			searchVO.setHostIP(defaultHostIP);
		}
		
		System.out.println("Search Query: " + searchVO.getSearchQuery() + "\nHost IP: " + searchVO.getHostIP());
		List<SearchVO> searchResults = dao.searchResult(searchVO);
		
		return searchResults;
	}
	
}
