package io.planb.admin.ad.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.ad.vo.AdVO;

@Repository
public class AdDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<AdVO> selectAdList() {
		List<AdVO> adList = sqlSessionTemplate.selectList("io.planb.admin.ad.dao.AdDAO.selectAdList");

		return adList;
	}

	public void insertAd(AdVO ad) {
		sqlSessionTemplate.insert("io.planb.admin.ad.dao.AdDAO.insertAd", ad);
	}

	public void updateAd(AdVO ad) {
		sqlSessionTemplate.update("io.planb.admin.ad.dao.AdDAO.updateAd", ad);
	}

	public void deleteAd(int location) {
		sqlSessionTemplate.delete("io.planb.admin.ad.dao.AdDAO.deleteAd", location);
	}

}
