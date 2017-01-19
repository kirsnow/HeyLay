package io.planb.statistic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.statistic.dao.StatisticDAO;

@Service
public class StatisticService {
	
	@Autowired
	private StatisticDAO dao;

}
