package io.planb.admin.contents.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import io.planb.admin.contents.dao.ContentsDAO;
import io.planb.bug.vo.BugVO;
import io.planb.bugAttach.vo.BugAttachVO;
import io.planb.contents.vo.DataTypeVO;
import io.planb.source.vo.SourceVO;

@Service
public class ContentsService {
	
	@Autowired
	private ContentsDAO dao;
	
	@Autowired
	private ServletContext servletContext;

	public int countSource(int option) {
		int sourceCnt = 0;
		
		if(option == 0) sourceCnt = dao.countSource();
		else sourceCnt = dao.countByOption(option);
		
		return sourceCnt;
	}
	
	public List<SourceVO> selectByOption(int option) {
		List<SourceVO> sourceList = new ArrayList<>();
		
		if(option == 0) sourceList = dao.selectSourceList();
		else sourceList = dao.selectByOption(option);
		
		return sourceList;
	}
	
	public void insertSource(/*MultipartFile multipartFile, */SourceVO source) {
//		// 실행되는 웹어플리케이션의 실제 경로 가져오기
//		String uploadDir = servletContext.getRealPath("/upload/");
//		System.out.println("uploadDir : " + uploadDir);
//
//		// ModelAndView mav = new ModelAndView("file/uploadResult");
//
//		// System.out.println("OwnerServiceImp id : " + owner.getId());
//
//		if (! multipartFile.isEmpty()) {
//
//			// 원본 파일명
//			String oriFileName = multipartFile.getOriginalFilename();
//			// System.out.println("원본 파일명 : " + oriFileName);
//
//			if (oriFileName != null && !oriFileName.equals("")) {
//
//				// 확장자 처리
//				String ext = "";
//				// 뒤쪽에 있는 . 의 위치
//				int index = oriFileName.lastIndexOf(".");
//				if (index != -1) {
//					// 파일명에서 확장자명(.포함)을 추출
//					ext = oriFileName.substring(index);
//				}
//
//				// 파일 사이즈
//				long fileSize = multipartFile.getSize();
//				// System.out.println("파일 사이즈 : " + fileSize);
//
//				// 고유한 파일명 만들기
//				String saveFileName = "quration-" + UUID.randomUUID().toString() + ext;
//				// System.out.println("저장할 파일명 : " + saveFileName);
//
//				// 임시저장된 파일을 원하는 경로에 저장
//				try {
//					multipartFile.transferTo(new File(uploadDir + "/" + saveFileName));
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				
//				source.setLogoImg(saveFileName);
//				
//			}
//		} else {
//			source.setLogoImg(null);
//		}

		dao.insertSource(source);
	
	}
	
	public void updateSource(SourceVO source) {
		dao.updateSource(source);
	}

	public void deleteSource(ArrayList<Integer> list) {
		for(Integer no : list) {
			dao.deleteSource(no);
		}
	}

	public void deleteSource(int no) {
		dao.deleteSource(no);
	}
	public List<BugVO> selectBugList() {
		List<BugVO> bugList = dao.selectBugList();
		
		return bugList;
	}

	public List<BugAttachVO> selectBugAttachList() {
		List<BugAttachVO> bugAttachList = dao.selectBugAttachList();
		
		return bugAttachList;
	}

	public BugVO selectBugDetail(int no) {
		BugVO bug = dao.selectBugDetail(no);
		
		return bug;
	}

	public BugAttachVO selectBugAttachDetail(int no) {
		BugAttachVO bugAttach = dao.selectBugAttachDetail(no);
		
		return bugAttach;
	}

	public void deleteBug(int no) {
		dao.deleteBug(no);
	}

	public List<DataTypeVO> selectDataType() {
		List<DataTypeVO> dataTypeList = dao.selectDataType();
		
		return dataTypeList;
	}

}
