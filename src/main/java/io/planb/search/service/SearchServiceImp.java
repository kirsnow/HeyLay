package io.planb.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.vo.ContentsVO;
import io.planb.memo.vo.MemoVO;
import io.planb.search.dao.SearchDAOImp;
import io.planb.search.vo.QueryVO;
import io.planb.search.vo.SearchVO;

@Service
public class SearchServiceImp {

	@Autowired
	private SearchDAOImp dao;
	
	public SearchVO searchResult(String q, String ip, int userNo) {
		
		//검색 실행
		SearchVO searchResult = dao.searchResult(q, ip);
		
		if(searchResult != null) {
			//검색어 세팅
			searchResult.setQuery(q);
			
			//검색결과 하이라이팅
			/*for( ContentsVO contents : searchResult.getContents() ) {
				contents = this.highlighter(contents, q);
			}*/
		}
		
		//검색 키워드 저장
		SearchVO kewordVO = new SearchVO();
		kewordVO.setQuery(q);
		kewordVO.setUserNo(userNo);
		if(searchResult != null) {
			kewordVO.setTotal( searchResult.getTotal() );
		} else {
			kewordVO.setTotal(0);
		}
		dao.saveKeyword(kewordVO);
		
		return searchResult;
	}

	public ContentsVO highlighter(ContentsVO contents, String q) {
		if(contents == null || q == null || q.equals("")) {
			// Do nothing!
		} else {
			String title = contents.getTitle();
			String summary = contents.getSummary();
			
			String originText = q;
			int start = title.toLowerCase().indexOf(q.toLowerCase());
			if(start >= 0) originText = title.substring(start, start + q.length());
			
			title = title.replaceAll("(?i)" + q, "<mark>" + originText + "</mark>");
			summary = summary.replaceAll("(?i)" + q, "<mark>" + originText + "</mark>");
			
			contents.setTitle(title);
			contents.setSummary(summary);
		}
		return contents;
	}
	
	public List<ContentsVO> getContentsList(int contentsNo) {
		List<ContentsVO> contentsList = dao.getContentsList(contentsNo);
		return contentsList;
	}
	
	public ContentsVO getContentsAll() {
		ContentsVO contentsA = dao.getContentsAll();
		return contentsA;
	}

	public List<MemoVO> getMemo(int no) {
		List<MemoVO> memoList = dao.getMemo(no);
		return memoList;
	}

	public List<QueryVO> analyzeQuery(String q) {
		List<QueryVO> queryList = dao.analyzeQuery(q);
		
		return queryList;
	}

}
