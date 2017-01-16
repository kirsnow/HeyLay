package io.planb.list.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.list.vo.ListVO;

@Repository
public class ListDAOImp {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ListVO> getCategoryList() {
		List<ListVO> lists = sqlSessionTemplate.selectList("io.planb.list.dao.ListDAO.selectCategoryAll");
		return lists;
	}

	public List<ListVO> getSourceList() {
		List<ListVO> lists = sqlSessionTemplate.selectList("io.planb.list.dao.ListDAO.selectSourceAll");
		return lists;
	}

	
}
