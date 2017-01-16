package io.planb.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.faq.dao.FaqDAOImp;
import io.planb.faq.vo.FaqVO;

@Service
public class FaqServiceImp {

	@Autowired
	private FaqDAOImp dao;
	
	public List<FaqVO> faqlists() {
		
		List<FaqVO>faqlists = dao.faqlists();
		return faqlists;
	}

	public FaqVO getDetail(int no) {
		FaqVO detail = dao.getDetail(no);
		return detail;
	}

}
