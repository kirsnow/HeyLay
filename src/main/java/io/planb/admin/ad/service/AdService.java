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

	public void manageAd(ArrayList<String> nameList, ArrayList<String> codeList, ArrayList<Integer> leftList) {
		System.out.println("nameList:" + nameList + ".");
		
		List<Integer> locationList = new ArrayList<>();
		int location = 0;
		
		for(int i = 0, j = leftList.size(); i < j; i++) {
			location = 1;
			for(int k = 0; k < j; k++) {
				if(i != k && leftList.get(i) > leftList.get(k)) location++;
			}
			locationList.add(i, location);
		}
		
		List<AdVO> beforeAdList = dao.selectAdList();
		boolean exist = false;
		
		for(int i = 0, j = nameList.size(); i < j; i++) {
			AdVO ad = new AdVO(0, locationList.get(i), codeList.get(i), nameList.get(i));
			for(AdVO beforeAd : beforeAdList) {
				if(beforeAd.getLocation() == ad.getLocation()) exist = true;
			}
			if(exist) {
				if(ad.getSiteName().equals("")) {
					System.out.println("ad[" + i + "].getSiteName():" + ad.getSiteName());
					dao.deleteAd(ad.getLocation());
				}
				else dao.updateAd(ad);
			}
			else dao.insertAd(ad);
		}
	}

}
