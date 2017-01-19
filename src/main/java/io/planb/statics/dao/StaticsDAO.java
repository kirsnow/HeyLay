package io.planb.statics.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.statics.vo.StaticsVO;

@Repository
public class StaticsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplte;

	public List<StaticsVO> selectSavedSource(String member) {
		List<StaticsVO> statisticList = sqlSessionTemplte.selectList("io.planb.statistic.dao.StatisticDAO.selectSavedSource", member);
		
		return statisticList;
	}

}
