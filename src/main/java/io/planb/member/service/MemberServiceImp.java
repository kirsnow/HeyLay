package io.planb.member.service;

import java.util.ArrayList;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import io.planb.leaved.vo.LeavedVO;
import io.planb.contents.dao.ContentDAO;
import io.planb.drawer.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.member.dao.MemberDAO;
import io.planb.member.vo.IdentifyQuestionVO;
import io.planb.member.vo.MemberVO;
import io.planb.member.vo.SelectKeywordsVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	private MemberDAO dao;
	@Autowired
	private ContentDAO conDao;

	@Autowired
	private ServletContext servletContext;

	@Override
	public MemberVO login(MemberVO member) {
		MemberVO userVO = dao.login(member);
		return userVO;
	}

	@Override
	public void enroll(MemberVO member) {
		int nextMeberNo = dao.getNextMemberNo();
		member.setNo(nextMeberNo);
		
		dao.enroll(member);

		dao.firstFolder(nextMeberNo);
	}

	@Override
	public List<MemberVO> selectByNo(MemberVO member) {
		List<MemberVO> memberList = dao.selectByNo(member);
		return memberList;
	}

	@Override
	public void withdraw(MemberVO member) {
		int no = member.getNo();
		System.out.println(no);
		conDao.leavedKeyword(no);
		conDao.leavedLike(no);
		conDao.leavedSave(no);
		conDao.leavedView(no);
		conDao.leavedDir(no);
		
		dao.withdraw(member);
	}

	@Override
	public void withdrawReason(LeavedVO leaved) {
		dao.withdrawReason(leaved);
	}

	@Override
	public void changePw(MemberVO member) {
		dao.changePw(member);
	}

	@Override
	public String mypageUpdate(MultipartFile multipartFile, MemberVO member) {

		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/");
		// System.out.println("uploadDir : " + uploadDir);

		// ModelAndView mav = new ModelAndView("file/uploadResult");

		// System.out.println("OwnerServiceImp id : " + owner.getId());
		
		String saveFileName = "";

		if (!multipartFile.isEmpty()) {

			// 원본 파일명
			String oriFileName = multipartFile.getOriginalFilename();
			// System.out.println("원본 파일명 : " + oriFileName);

			if (oriFileName != null && !oriFileName.equals("")) {

				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}

				// 파일 사이즈
				long fileSize = multipartFile.getSize();
				// System.out.println("파일 사이즈 : " + fileSize);

				// 고유한 파일명 만들기
				saveFileName = "quration-" + UUID.randomUUID().toString() + ext;
				// System.out.println("저장할 파일명 : " + saveFileName);

				// 임시저장된 파일을 원하는 경로에 저장
				try {
					multipartFile.transferTo(new File(uploadDir + "/" + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}

				member.setProfileImg(saveFileName);

//				System.out.println("saveFileName : " + saveFileName);
				// System.out.println("Service noticeAttach : " + noticeAttach);

				dao.mypageUpdate(member);
				
			}
		}
		return saveFileName;
	}

	@Override
	public void updateType(int no) {
		dao.updateType(no);

	}

	@Override
	public List<DirectoryVO> selectFolder(int memberNo) {
		List<DirectoryVO> folderList = dao.selectFolder(memberNo);
		return folderList;
	}

	@Override
	public void deleteDirectory(ArrayList<Map<Integer, String>> list) {

	}

	@Override
	public void updateName(Map<Integer, String> params) {
		dao.updateName(params);

	}
    
	/*관심 키워드 선택지 호출*/
	@Override
	public List<KeywordsVO> selectInterestList() {
		List<KeywordsVO> interestKeywordList = dao.selectInterestList();
		return interestKeywordList;
	}
	
	/*계정&비밀번호 찾기용 질문*/
	@Override
	public List<IdentifyQuestionVO> selectIdenQuestion() {
		List<IdentifyQuestionVO> idenQuestionList = dao.selectIdenQuestion();
		
		return idenQuestionList;
	}
	
	//회원 탈퇴 시 보유 컨텐츠 호출
	@Override
	public int selectWithdrawContentCnt(int memberNo) {
		int withdrawContentCnt = dao.selectWithdrawContentCnt(memberNo);
		return withdrawContentCnt;
	}

	@Override
	public void insertKeywords(ArrayList<String> list, int no) {
		for(String keyword : list) {
			SelectKeywordsVO keywords = new SelectKeywordsVO();
			keywords.setMemberNo(no);
			keywords.setKeyword(keyword);
			
			dao.insertKeywords(keywords);
		}
	}
	
	//계정 찾기
	@Override
	public String selectMemberAccount(MemberVO member) {
		String userAccount = dao.selectMemberAccount(member);
		return userAccount;
	}
	
	//비밀번호 찾기
	@Override
	public String selectMemberPassword(MemberVO member) {
		String userPassword = dao.selectMemberPassword(member);
		return userPassword;
	}
	
	//계정 중복 확인
	@Override
	public String checkEmail(String email) {
		email = dao.checkEmail(email);
		 return email;
	}
<<<<<<< HEAD

	@Override
	public String selectType(int no) {
		String type = dao.selectType(no);
		return type;
=======
	
	//가입 or 로그인 후 검색 이전 키워드 추천
	@Override
	public String selectRecommandList() {
		String recommandList = dao.selectRecommandList();
		
		return recommandList;
>>>>>>> b624377d0bf8078550feab27f1bcd3d3c45f3d77
	}
}
