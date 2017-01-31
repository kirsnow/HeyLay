package io.planb.search.service;

import java.io.IOException;
import java.util.List;

import org.json.JSONException;
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
	
	public SearchVO searchResult(String q, String host) throws JSONException, IOException {
		
		String defaultHostIP = "52.35.61.184"; //Host IP 미설정 시, defaultHostIP에서 검색 실행
														//Host IP 뒤에 포트가 붙어 "http://54.244.108.159:9200" 형식이 된다.
		String hostIP = host != null ? host : defaultHostIP;
		System.out.println("Search Query: " + q + "\nHost IP: " + hostIP);
		SearchVO searchResult = dao.searchResult(q, host);
		
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
