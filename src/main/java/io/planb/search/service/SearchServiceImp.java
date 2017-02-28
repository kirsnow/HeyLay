package io.planb.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.ad.vo.AdVO;
import io.planb.contents.service.ContentService;
import io.planb.contents.vo.ContentsVO;
import io.planb.memo.vo.MemoVO;
import io.planb.search.dao.SearchDAOImp;
import io.planb.search.vo.QueryVO;
import io.planb.search.vo.SearchVO;

@Service
public class SearchServiceImp {

	@Autowired
	private SearchDAOImp dao;
	
	@Autowired
	private ContentService conService;
	
	public SearchVO searchResult(String q, String ip, int memberNo) {
		
		//검색 실행
		SearchVO searchResult = dao.searchResult(q, ip);
		
		//검색결과가 있는 경우
		if(searchResult != null) {
			//검색어 세팅
			searchResult.setQuery(q);
			
			//형태소 분석
			List<QueryVO> queryList = this.analyzeQuery(q);
			if(queryList.size() > 0) searchResult.setQueryList(queryList);
			
			List<ContentsVO> cardList = searchResult.getCards();
			if(memberNo > 0) {
				// 해당 회원의 저장, 좋아요, 조회 여부 확인
				cardList = conService.checkMemberActivity(memberNo, searchResult.getCards());
			}
			//검색결과에 광고 목록 추가
			cardList = this.setAds(cardList);
			
			searchResult.setCards(cardList);
		}
		
		//검색 키워드 저장
		this.saveKeywords(q, searchResult, memberNo);
		
		return searchResult;
	}
	
	public void saveKeywords(String q, SearchVO searchResult, int memberNo) {
		if(q != null) {
			SearchVO keywordVO = new SearchVO();
			keywordVO.setQuery(q);
			keywordVO.setUserNo(memberNo);
			
			if(searchResult != null) {
				keywordVO.setTotal( searchResult.getTotal() );
			} else {
				keywordVO.setTotal(0);
			}
			//질의어 저장
			keywordVO.setKeywordType('Q');
			dao.saveKeyword(keywordVO);
			
			//형태소 분석 결과 중, 명사만 저장
			if(searchResult.getQueryList() != null) {
				for(QueryVO vo : searchResult.getQueryList()) {
					if(vo.getType().equals("명사")) {
						keywordVO.setQuery(vo.getToken());
						keywordVO.setKeywordType('N');
						dao.saveKeyword(keywordVO);
					}
				}
			}
		}
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
	
	public List<ContentsVO> setAds(List<ContentsVO> cardList) {
		List<AdVO> adList = dao.getAdList();
		
		for(AdVO ad : adList) {
			ContentsVO adCard = new ContentsVO();
			adCard.setIsAd(true);
			adCard.setTitle(ad.getSiteName());
			adCard.setImgUrl(ad.getCode());
			cardList.add(ad.getLocation() + 3, adCard);
		}
		
		return cardList;
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
