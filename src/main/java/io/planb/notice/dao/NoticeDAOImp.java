package io.planb.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImp {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<NoticeVO> getLists() {
		List<NoticeVO> lists = sqlSessionTemplate.selectList("io.planb.notice.dao.noticeDAO.selectAll");
		return lists;
	}

	public NoticeVO getDetail(int no) {
		NoticeVO detail = sqlSessionTemplate.selectOne("io.planb.notice.dao.noticeDAO.selectOne", no);
		return detail;
	}

	public void viewCntUp(int no) {
		sqlSessionTemplate.update("io.planb.notice.dao.noticeDAO.viewCntUp", no);
	}
}
