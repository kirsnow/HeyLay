package io.planb.statistic.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplte;

}
