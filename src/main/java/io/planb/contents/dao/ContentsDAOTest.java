package io.planb.contents.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;
import io.planb.contents.vo.DrawerHeaderVO;

@Repository
public class ContentsDAOTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ContentsVO> getSavedCards(ContentsVO vo) {
		
		List<ContentsVO> savedCards = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectContents", vo);
		System.out.println("savedCards.size: " + savedCards.size());
		if(savedCards.size() > 0) System.out.println("savedCard no.1: " + savedCards.get(0).toString());
		return savedCards;
	}

	public List<DrawerHeaderVO> getDrawerHeader(DrawerHeaderVO vo) {
		
		List<DrawerHeaderVO> headers = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectDrawerHeader", vo);
		System.out.println("headers.size: " + headers.size());
		if(headers.size() > 0) System.out.println("header no.1: " + headers.get(0).toString());
		return headers;
	}
}
