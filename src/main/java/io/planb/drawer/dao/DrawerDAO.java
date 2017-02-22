package io.planb.drawer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;

@Repository
public class DrawerDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void saveCard(ContentsVO card) {
		sqlSessionTemplate.insert("io.planb.drawer.dao.DrawerDAO.insertCardToSave", card);
	}

}
