package io.planb.drawer.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.drawer.vo.DirectoryVO;

@Repository
public class DirectoryDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<DirectoryVO> selectFolder(int memberNo) {
		List<DirectoryVO> folderList = sqlSessionTemplate.selectList("io.planb.member.dao.MemberDAO.selectFolder", memberNo);
		return folderList;
	}
}
