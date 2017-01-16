package io.planb.admin.ad.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.ad.vo.AdVO;
import io.planb.admin.ad.dao.AdDAO;

@Service
public class AdService {
	
	@Autowired
	private AdDAO dao;

	public List<AdVO> selectAdList() {
		List<AdVO> adList = dao.selectAdList();

		return adList;
	}

	public void insertAd(AdVO ad) {
		dao.insertAd(ad);
	}

	public void updateAd(AdVO ad) {
		dao.updateAd(ad);
	}

	public void deleteAd(int no) {
		dao.deleteAd(no);
	}

}
