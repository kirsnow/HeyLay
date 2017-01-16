package io.planb.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.faq.vo.FaqVO;

@Repository
public class FaqDAOImp  {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<FaqVO> faqlists() {

		List<FaqVO> faqlists = sqlSessionTemplate.selectList("io.planb.faq.dao.faDAO.selectAll");
		return faqlists;

	}

	public FaqVO getDetail(int no) {
		FaqVO detail = sqlSessionTemplate.selectOne("io.planb.faq.dao.faDAO.selectOne", no);
		return detail;
	}

}
