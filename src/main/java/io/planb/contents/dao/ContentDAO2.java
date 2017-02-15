package io.planb.contents.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;

@Repository
public class ContentDAO2 {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ContentsVO> getSavedCards(int memberNo) {
		List<ContentsVO> savedCards = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectContents", memberNo);
		System.out.println("savedCards.size: " + savedCards.size());
		return savedCards;
	}

}
