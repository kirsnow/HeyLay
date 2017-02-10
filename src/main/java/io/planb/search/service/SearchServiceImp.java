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
		
		//검색 실행
		SearchVO searchResult = dao.searchResult(q, ip);
		
		//검색 키워드 저장
		SearchVO keyword = new SearchVO();
		if(searchResult == null) keyword.setTotal(0);
		keyword.setQuery(q);
		keyword.setUserNo(userNo);
		dao.saveKeyword(keyword);
		
		return searchResult;
	}

	public ContentsVO getContents(int contentsNo, String q) {
		ContentsVO contents = dao.getContents(contentsNo);
		if(q != null) {
			String text = contents.getSummary();
			text = text.replace(q, "<mark>" + q + "</mark>");
			contents.setSummary(text);
		}
		return contents;
	}
	
	public List<ContentsVO> getContentsList(int contentsNo) {
		List<ContentsVO> contentsList = dao.getContentsList(contentsNo);
		return contentsList;
	}
	
	public ContentsVO getContentsAll() {
		ContentsVO contentsA = dao.getContentsAll();
		System.out.println(contentsA.toJson());
		return contentsA;
	}

	public List<MemoVO> getMemo(int no) {
		List<MemoVO> memoList = dao.getMemo(no);
		return memoList;
	}

}
