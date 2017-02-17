package io.planb.drawer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.drawer.vo.DirectoryVO;

@Service
public class DirectoryService {

	@Autowired
	private DirectoryDAO dao;
	
	public List<DirectoryVO> selectFolder(int memberNo) {
		List<DirectoryVO> folderList = dao.selectFolder(memberNo);
		return folderList;
	}
}
