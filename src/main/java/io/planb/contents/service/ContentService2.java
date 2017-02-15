package io.planb.contents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentDAO2;
import io.planb.contents.vo.ContentsVO;

@Service
public class ContentService2 {

	@Autowired
	private ContentDAO2 dao;
	
	public List<ContentsVO> getSavedCards(int memberNo) {
		List<ContentsVO> savedCards = dao.getSavedCards(memberNo);
		return savedCards;
	}

}
