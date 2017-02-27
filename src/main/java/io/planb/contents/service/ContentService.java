package io.planb.contents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentDAO;
import io.planb.contents.vo.ContentsVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.search.service.SearchServiceImp;

@Service
public class ContentService {

	@Autowired
	private ContentDAO dao;
	
	@Autowired
	private SearchServiceImp searchService;
	
	/* Contents detail */
	public ContentsVO getContentsDetail(int contentsNo, String q, int memberNo) {
		ContentsVO contents = getContentsByNo(contentsNo);
		contents = searchService.highlighter(contents, q);
		
		if(contents != null) {
			
			//이전, 이후 콘텐츠 번호 추출
			int prevContentsNo = dao.getPrevContentsNo(contentsNo);
			int nextContentsNo = dao.getNextContentsNo(contentsNo);
			if(prevContentsNo > 0) contents.setPrevContentsNo(prevContentsNo);
			if(nextContentsNo > 0) contents.setNextContentsNo(nextContentsNo);
		}
		return contents;
	}
	
	/* Cards List */
	public List<ContentsVO> getCardsByNo(int contentsNo) {
		ContentsVO vo = new ContentsVO();
		vo.setContentsNo(contentsNo);
		
		List<ContentsVO> cards = dao.getCardsList(vo);
		return cards;
	}
	
	public ContentsVO getContentsByNo(int contentsNo) {
		ContentsVO vo = new ContentsVO();
		vo.setContentsNo(contentsNo);
		
		if(dao.selectView(vo) == 0) {
			dao.insertView(vo);
		} else {
			dao.updateView(vo);
		}
		
		ContentsVO contents = dao.getContents(vo);
		if(contents != null) {
			// 저장된 횟수 추출
			int savedCnt = dao.getSavedCnt(contentsNo);
			contents.setSavedCnt(savedCnt);
		}
		
		return contents;
	}
	
	public void viewCnt(ContentsVO view) {
		int cnt = dao.selectView(view);
		if(cnt == 0) {
			dao.insertView(view);
		} else {
			dao.updateView(view);
		}
	}
	
	public ContentsVO isThisSaved(int memberNo, ContentsVO card) {
		//해당 회원이 저장한 콘텐츠 번호 목록 추출
		List<Integer> savedList = dao.getSavedContentsNo(memberNo);
		card.setIsSaved(false);
		//저장한 콘텐츠 여부 확인
		for(int savedNo : savedList) {
			if(savedNo == card.getContentsNo()) {
				card.setIsSaved(true);
				break;
			}
		}
		return card;
	}
	
	public List<ContentsVO> isThisSaved(int memberNo, List<ContentsVO> cardList) {
		//해당 회원이 저장한 콘텐츠 번호 목록 추출
		List<Integer> savedList = dao.getSavedContentsNo(memberNo);
		
		//저장한 콘텐츠 여부 확인: 저장한 콘텐츠는 savedCnt를 1로, 저장하지 않은 콘텐츠는 savedCnt를 0으로 설정한다.
		for(ContentsVO card : cardList) {
			card.setIsSaved(false);
			for(int savedNo : savedList) {
				if(savedNo == card.getContentsNo()) {
					card.setIsSaved(true);	
					break;
				}
			}
		}
		return cardList;
	}

	public ContentsVO isThisLiked(int memberNo, ContentsVO card) {
		//해당 회원이 저장한 콘텐츠 번호 목록 추출
		List<Integer> likedList = dao.getLikedContentsNo(memberNo);
		
		card.setIsLiked(false);
		//저장한 콘텐츠 여부 확인
		for(int likedNo : likedList) {
			if(likedNo == card.getContentsNo()) card.setIsLiked(true); break;
		}
		return card;
	}

	public List<ContentsVO> isThisLiked(int memberNo, List<ContentsVO> cardList) {
		//해당 회원이 저장한 콘텐츠 번호 목록 추출
		List<Integer> likedList = dao.getLikedContentsNo(memberNo);
		
		//저장한 콘텐츠 여부 확인: 저장한 콘텐츠는 savedCnt를 1로, 저장하지 않은 콘텐츠는 savedCnt를 0으로 설정한다.
		for(int likedNo : likedList) {
			for(ContentsVO card : cardList) {
				card.setIsLiked(false);
				if(likedNo == card.getContentsNo()) {
					card.setIsLiked(true);
					break;
				}
			}
		}
		return cardList;
	}
	
	public List<KeywordsVO> selectKeywordList(int memberNo) {
		List<KeywordsVO> keywordList = dao.selectKeywordList(memberNo);
		return keywordList;
	}
	
	public void updateStatus(KeywordsVO keyword) {
		dao.updateStatus(keyword);
	} 
	
	public List<ContentsVO> drawerCards(int memberNo) {
		List<ContentsVO> drawerCards = dao.drawerCards(memberNo);
		return drawerCards;
	}

	public List<ContentsVO> selectPopularList() {
		ContentsVO contents = new ContentsVO();
		contents.setLimit(3);
		
		List<ContentsVO> popularList = dao.getCardsList(contents);
		
		return popularList;
	}
	
	public List<ContentsVO> selectCustomSourceList(int no) {
		List<ContentsVO> customSourceList = dao.selectCustomSourceList(no);
		
		return customSourceList;
	}

	public List<ContentsVO> selectCustomKeywordList(int no) {
		List<KeywordsVO> keywordList = dao.selectUserKeywordList(no);
		String keywords = "";
		
		if(keywordList.isEmpty()) return null;
		
		for(int i = 0, j = keywordList.size(); i < j; i++) {
			if(i != 0) keywords += "|";
			keywords += keywordList.get(i).getKeyword();
		}
		
		List<ContentsVO> customKeywordList = dao.selectCustomCuration(keywords);
		
		return customKeywordList;
	}
	
	public void likeCntUp(ContentsVO like) {
		dao.likeCntUp(like);
	}
	
	public void likeCancel(ContentsVO like) {
		dao.likeCancel(like);
	}
	
	public ContentsVO likeOrNot(ContentsVO contents) {
		int isLiked = dao.likeOrNot(contents);
		if(isLiked > 0) {
			contents.setIsLiked(true);
		} else {
			contents.setIsLiked(false);
		}
		
		return contents;
	}
	
	public int selectLikeCnt(int contentsNo) {
		int cnt = dao.selectLikeCnt(contentsNo);
		
		return cnt;
	}
	
//	public ContentsVO selectViewList(int memberNo, int contentsNo) {
//		List<ContentsVO> cntList = dao.selectViewList(memberNo);
//		
//		for(ContentsVO contents : cntList) {
//			for(cntList : contents.getContentsNo()) {
//				
//			}
//		}
//		
//		return contents;
//	}
	
	public void insertView(ContentsVO view) {
		dao.insertView(view);
	}
	
	public void updateView(ContentsVO view) {
		dao.updateView(view);
	}
	
	public int selectSavedCnt(int contentsNo) {
		int cnt = dao.selectSavedCnt(contentsNo);
		return cnt;
	}

}
