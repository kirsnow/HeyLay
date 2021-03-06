package io.planb.drawer.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentDAO;
import io.planb.contents.service.ContentService;
import io.planb.contents.vo.ContentsVO;
import io.planb.drawer.dao.DrawerDAO;
import io.planb.drawer.vo.DrawerVO;

@Service
public class DrawerService {

	@Autowired
	private DrawerDAO dao;
	
	@Autowired
	private ContentDAO contentDAO;
	
	@Autowired
	private DirectoryService dirService;
	
	@Autowired
	private ContentService conService;
	
	/* Saved cards */
	public List<ContentsVO> getSavedCardsForMember(int memberNo) {
		ContentsVO vo = new ContentsVO();
		vo.setMemberNo(memberNo);
    
		List<ContentsVO> savedCards = contentDAO.getSavedCards(vo);
		// 해당 회원의 저장, 좋아요, 조회 여부 확인
		savedCards = conService.checkMemberActivity(memberNo, savedCards);
		
		return savedCards;
	}
	
	public Set<String> getHeaderList(List<ContentsVO> savedCards, String sort) {
		Set<String> headerList = new LinkedHashSet<String>();
		for(ContentsVO card : savedCards) {
			String header = getCompare(card, sort);
			if( !headerList.contains(header) ) {
				headerList.add(header);
			}
		}
		return headerList;
	}
	
	public String getCompare(ContentsVO card, String sort) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd.");
		String compare = null;
		switch(sort) {
			case "days": compare = sdf.format(card.getSavedDate()); break;
			case "type": compare = card.getDataTypeName(); break;
			case "source": compare = card.getSourceName(); break;
			case "directory": compare = card.getDirectoryName(); break;
			default: compare = card.getDirectoryName(); break;
		}
		return compare;
	}
	
	public List<DrawerVO> getDrawerList(int memberNo, String sort) {
		if(sort == null) sort = "directory";
		// Get saved cards from DB
		List<ContentsVO> savedCards = this.getSavedCardsForMember(memberNo);
		
		// Get header list
		Set<String> drawerHeader = this.getHeaderList(savedCards, sort);
		
		// Get card list to print
		List<DrawerVO> drawerList = new ArrayList<>();
		for(String header : drawerHeader) {
			List<ContentsVO> cardList = new ArrayList<ContentsVO>();
			
			for(ContentsVO card : savedCards) {
				if( header.equals(getCompare(card, sort)) ) {
					cardList.add(card);
				}
			}

			DrawerVO drawer = new DrawerVO();
			drawer.setHeader(header);
			drawer.setCards(cardList);
			drawerList.add(drawer);
		}
		return drawerList;
	}
	
	public void saveCard(int memberNo, int contentsNo, String dirName, int dirNo) {
		
		ContentsVO card = new ContentsVO();
		card.setMemberNo(memberNo);
		card.setContentsNo(contentsNo);
		card.setDirectoryNo(dirNo);
		card.setDirectoryName(dirName);
		
		if(card.getDirectoryNo() < 0) {
			int directoryNo = dirService.newDirectory(card.getMemberNo(), card.getDirectoryName());
			card.setDirectoryNo(directoryNo);
		}
		dao.saveCard(card);
	}

	public void delCard(int userNo, int contentsNo) {
		ContentsVO card = new ContentsVO();
		card.setMemberNo(userNo);
		card.setContentsNo(contentsNo);
		
		dao.delCard(card);
	}
	
}
