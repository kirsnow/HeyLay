package io.planb.admin.statistic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.admin.statistic.dao.StatisticDAO;

@Service
public class StatisticService {
	
	@Autowired
	private StatisticDAO dao;

}
