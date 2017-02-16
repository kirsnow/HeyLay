package io.planb.contents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentsDAOTest;
import io.planb.contents.vo.ContentsVO;

@Service
public class ContentsServiceTest {

	@Autowired
	private ContentsDAOTest dao;
	
	/* Contents cards */
	public List<ContentsVO> getCardsByNo(int contentsNo) {
		ContentsVO vo = new ContentsVO();
		vo.setContentsNo(contentsNo);
		
		List<ContentsVO> savedCards = dao.getSavedCards(vo);
		return savedCards;
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
