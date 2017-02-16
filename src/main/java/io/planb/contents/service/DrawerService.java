package io.planb.contents.service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentsDAOTest;
import io.planb.contents.vo.ContentsVO;
import io.planb.contents.vo.DrawerVO;

@Service
public class DrawerService {

	@Autowired
	private ContentsDAOTest dao;
	
	/* Saved cards */
	public List<ContentsVO> getSavedCardsForMember(int memberNo) {
		ContentsVO vo = new ContentsVO();
		vo.setMemberNo(memberNo);
		
		List<ContentsVO> savedCards = dao.getSavedCards(vo);
		return savedCards;
	}
	
	public List<DrawerVO> getSavedCardsByDays(int memberNo) {
		List<ContentsVO> savedCards = getSavedCardsForMember(memberNo);
		
		Set<String> savedDays = new LinkedHashSet<String>();
		for(ContentsVO card : savedCards) {
			String cardDate = card.getSavedDaysAgo();
			if( !savedDays.contains(cardDate) ) {
				savedDays.add(cardDate);
			}
		}
		
		List<DrawerVO> drawerList = new ArrayList<>();
		for(String day : savedDays) {
			List<ContentsVO> cardList = new ArrayList<ContentsVO>();
			
			for(ContentsVO card : savedCards) {
				if( day.equals(card.getSavedDaysAgo()) ) {
					cardList.add(card);
				}
			}
			DrawerVO drawer = new DrawerVO();
			drawer.setHeader(day);
			drawer.setCards(cardList);
			drawerList.add(drawer);
		}
		System.out.println("drawerList.size: " + drawerList.size());
		
		return drawerList;
	}
	
	public List<ContentsVO> getSavedCardsBySavedNo(int savedNo) {
		ContentsVO vo = new ContentsVO();
		vo.setSavedNo(savedNo);
		
		List<ContentsVO> savedCards = dao.getSavedCards(vo);
		return savedCards;
	}
}
