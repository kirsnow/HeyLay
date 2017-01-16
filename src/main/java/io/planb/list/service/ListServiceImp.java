package io.planb.list.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.list.dao.ListDAOImp;
import io.planb.list.vo.ListVO;

@Service
public class ListServiceImp {

	@Autowired
	private ListDAOImp dao;
	
	public List<ListVO> getCategoryList() {
		List<ListVO> list = dao.getCategoryList();
		return list;
	}

	public List<ListVO> getSourceList() {
		List<ListVO> list = dao.getSourceList();
		return list;
	}
	
}
