package io.planb.statistic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import io.planb.statistic.service.StatisticService;

@Controller
public class StatisticController {
	
	@Autowired
	private StatisticService service;
	
	/* 내가 많이 담은 사이트 */
	public String selectSavedSource() {
		
		return "";
	}
	
}
