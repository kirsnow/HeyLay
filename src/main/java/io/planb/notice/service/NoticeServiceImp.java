package io.planb.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.notice.dao.NoticeDAOImp;
import io.planb.notice.vo.NoticeVO;

@Service
public class NoticeServiceImp {

	@Autowired
	private NoticeDAOImp dao;
	
	public List<NoticeVO> getLists() {
		List<NoticeVO> lists = dao.getLists();
		return lists;
	}

	public NoticeVO getDetail(int no, String prepage) {
		if(prepage.equals("list")) { dao.viewCntUp(no); }
		if(no <= 0) { no = 1; }
		
		NoticeVO detail = dao.getDetail(no);
		return detail;
	}
}
