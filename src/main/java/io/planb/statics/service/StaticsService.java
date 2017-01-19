package io.planb.statics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.statics.dao.StaticsDAO;
import io.planb.statics.vo.StaticsVO;

@Service
public class StaticsService {
	
	@Autowired
	private StaticsDAO dao;

	public List<StaticsVO> selectSavedSource(String member) {
		List<StaticsVO> statisticList = dao.selectSavedSource(member);
		
		return statisticList;
	}

}
