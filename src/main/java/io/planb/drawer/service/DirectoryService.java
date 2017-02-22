package io.planb.drawer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.drawer.dao.DirectoryDAO;
import io.planb.drawer.vo.DirectoryVO;

@Service
public class DirectoryService {

	@Autowired
	private DirectoryDAO dao;
	
	public List<DirectoryVO> selectFolder(int memberNo) {
		List<DirectoryVO> folderList = dao.selectFolder(memberNo);
		return folderList;
	}

	public List<DirectoryVO> directoryList(int userNo) {
		List<DirectoryVO> dirList = dao.directoryList(userNo);
		return dirList;
	}
	
	public int newDirectory(int memberNo, String dirName) {
		
		DirectoryVO newDir = new DirectoryVO();
		newDir.setMemberNo(memberNo);
		newDir.setName(dirName);
		
		int dirNo = dao.nextDirNo();
		newDir.setNo(dirNo);
		dao.newDirectory(newDir);
		return dirNo;
	}

	public void updateDir(DirectoryVO dir) {
		dao.updateDir(dir);
	}

	public void delDir(List<Integer> noList) {
		dao.delDir(noList);
	}
	
}
