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

	public List<StaticsVO> selectSavedSource(int no) {
		List<StaticsVO> staticsList = dao.selectSavedSource(no);
		
		return staticsList;
	}

	public List<StaticsVO> selectSourceType(int no) {
		List<StaticsVO> staticsList = dao.selectSourceType(no);
		
		return staticsList;
	}


	public List<StaticsVO> selectwordCloudList(int memberNo) {
		List<StaticsVO> wordCloudList = dao.selectWordCloudList(memberNo);
		
		return wordCloudList;
	}

	public List<StaticsVO> selectAllUserWordCloudList(StaticsVO columnName) {
		List<StaticsVO> AllWordCloudList = dao.selectAllUserWordCloudList(columnName);
		
		return AllWordCloudList;
	}
	
	public List<StaticsVO> selectAllSavedSource() {
		List<StaticsVO> staticsList = dao.selectAllSavedSource();
		
		return staticsList;
	}

	public List<StaticsVO> selectAllSourceType() {
		List<StaticsVO> staticsList = dao.selectAllSourceType();
		
		return staticsList;
	}
}
