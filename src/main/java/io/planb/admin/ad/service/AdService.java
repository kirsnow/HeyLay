package io.planb.admin.ad.service;

import java.util.ArrayList;
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

	public void updateAd(ArrayList<String> nameList, ArrayList<String> codeList, ArrayList<Integer> leftList) {
		System.out.println("nameList: " + nameList);
		System.out.println("codeList: " + codeList);
		System.out.println("leftList: " + leftList);
		
		List<AdVO> adList = new ArrayList<>();
		
		for(int i = 0, j = nameList.size(); i < j; i++) {
			AdVO ad = new AdVO();
			
			ad.setSiteName(nameList.get(i));
			ad.setCode(codeList.get(i));
			
			if(i > 0 && leftList.get(i) > leftList.get(i - 1)) adList.add(i - 1, ad);
			else adList.add(i, ad);
		}
		System.out.println(adList.toString());
	}

}
