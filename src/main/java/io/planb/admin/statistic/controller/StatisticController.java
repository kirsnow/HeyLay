package io.planb.admin.statistic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import io.planb.admin.contents.service.ContentsService;
import io.planb.admin.statistic.service.StatisticService;

@Controller
public class StatisticController {
	
	@Autowired
	private StatisticService service;

}
