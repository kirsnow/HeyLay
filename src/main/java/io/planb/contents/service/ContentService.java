package io.planb.contents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentDAO;
import io.planb.contents.vo.ContentsVO;
import io.planb.drawer.service.DirectoryService;
import io.planb.drawer.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.search.service.SearchServiceImp;

@Service
public class ContentService {

	@Autowired
	private ContentDAO dao;
	
	@Autowired
	private SearchServiceImp searchService;
	
	@Autowired
	private DirectoryService dirService;
	
	/* Contents detail */
	public ContentsVO getContentsByNo(int contentsNo) {
		ContentsVO vo = new ContentsVO();
		vo.setContentsNo(contentsNo);
		
		ContentsVO contents = dao.getContents(vo);
		return contents;
	}
	
	public ContentsVO getContentsDetail(int contentsNo, String q) {
		ContentsVO contents = getContentsByNo(contentsNo);
		contents = searchService.highlighter(contents, q);
		return contents;
	}
	
	/* Cards List */
	public List<ContentsVO> getCardsByNo(int contentsNo) {
		ContentsVO vo = new ContentsVO();
		vo.setContentsNo(contentsNo);
		
		List<ContentsVO> cards = dao.getCardsList(vo);
		return cards;
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

	public void saveCard(ContentsVO card) {
		if(card.getDirectoryNo() < 0) {
			DirectoryVO newDir = new DirectoryVO();
			newDir.setMemberNo(card.getMemberNo());
			newDir.setName(card.getDirectoryName());
			
			int directoryNo = dirService.newDirectory(newDir);
			card.setDirectoryNo(directoryNo);
		}
		dao.saveCard(card);
	}

	public List<ContentsVO> selectPopularList() {
		List<ContentsVO> popularList = dao.selectPopularList();
		
		return popularList;
	}
	
	public List<ContentsVO> selectCustomSourceList(int no) {
		List<ContentsVO> customSourceList = dao.selectCustomSourceList(no);
		
		return customSourceList;
	}

	public List<ContentsVO> selectCustomKeywordList(int no) {
		List<KeywordsVO> keywordList = dao.selectUserKeywordList(no);
		String keywords = "";
		
		for(int i = 0, j = keywordList.size(); i < j; i++) {
			if(i != 0) keywords += "|";
			keywords += keywordList.get(i).getKeyword();
		}
		
		List<ContentsVO> customKeywordList = dao.selectCustomCuration(keywords);
		
		return customKeywordList;
	}

}
