package io.planb.drawer.dao;

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

	public int nextDirNo() {
		int nextDirNo = sqlSessionTemplate.selectOne("io.planb.contents.dao.ContentDAO.selectNextDirNo");
		return nextDirNo;
	}
	
	public List<DirectoryVO> directoryList(int userNo) {
		List<DirectoryVO> dirList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectDirList", userNo);
		return dirList;
	}

	public void newDirectory(DirectoryVO newDir) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.insertDir", newDir);		
	}

	public void updateDir(DirectoryVO dir) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.updateDir", dir);
	}
	
	public void delDir(int no) {
		sqlSessionTemplate.delete("io.planb.contents.dao.ContentDAO.delDir", no);
	}

	public void delDir(List<Integer> noList) {
		sqlSessionTemplate.delete("io.planb.contents.dao.ContentDAO.deleteDirs", noList);
		
	}

}
