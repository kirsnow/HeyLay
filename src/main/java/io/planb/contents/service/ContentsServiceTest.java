package io.planb.contents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentDAO;
import io.planb.contents.vo.ContentsVO;

@Service
public class ContentsServiceTest {

	@Autowired
	private ContentDAO dao;
	
	/* 1 Contents (by conentsNo) */
	public ContentsVO getContentsByNo(int contentsNo) {
		ContentsVO vo = new ContentsVO();
		vo.setContentsNo(contentsNo);
		
		ContentsVO contents = dao.getContents(vo);
		return contents;
	}
	
	/* Contents cards List */
	public List<ContentsVO> getCardsByNo(int contentsNo) {
		ContentsVO vo = new ContentsVO();
		vo.setContentsNo(contentsNo);
		
		List<ContentsVO> cards = dao.getCardsList(vo);
		return cards;
	}
	
	
	
	public List<ContentsVO> getCardsByCategory(int categoryNo) {
		ContentsVO vo = new ContentsVO();
		vo.setCategoryNo(categoryNo);
		
		List<ContentsVO> savedCards = dao.getSavedCards(vo);
		return savedCards;
	}
	
	public List<ContentsVO> getCardsBySource(int sourceNo) {
		ContentsVO vo = new ContentsVO();
		vo.setSourceNo(sourceNo);
		
		List<ContentsVO> savedCards = dao.getSavedCards(vo);
		return savedCards;
	}
	
	public List<ContentsVO> getCardsByDataType(int dataTypeNo) {
		ContentsVO vo = new ContentsVO();
		vo.setDataTypeNo(dataTypeNo);
		
		List<ContentsVO> savedCards = dao.getSavedCards(vo);
		return savedCards;
	}

}
