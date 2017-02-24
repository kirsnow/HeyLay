package io.planb.contents.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.service.ContentService;
import io.planb.contents.vo.ContentsVO;
import io.planb.drawer.service.DirectoryService;
import io.planb.drawer.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.member.vo.MemberVO;
import io.planb.memo.service.MemoServiceImp;
import io.planb.memo.vo.MemoVO;

@Controller
public class ContentController {

	@Autowired
	private ContentService service;
	@Autowired
	private MemoServiceImp memoService;
	@Autowired
	private DirectoryService dirService;

	/* Contents detail */
	@RequestMapping(value = "/contents.do", method = RequestMethod.GET)
	public ModelAndView viewContents(HttpServletRequest request, HttpSession session, @RequestParam int no,
			@RequestParam(required = false) String q) {

		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;

		ContentsVO contents = new ContentsVO();
		contents.setMemberNo(userNo);
		contents.setContentsNo(no);

		// 콘텐츠 내용
		contents = service.getContentsDetail(no, q, userNo);
		
		
		
		// 콘텐츠 메모 목록
		List<MemoVO> memoList = memoService.getMemoList(no);
		
		ModelAndView mav = new ModelAndView();
		if (userVO != null) {
			// 내 카드 서랍 목록 (로그인 시)
			List<DirectoryVO> dirList = dirService.directoryList(userNo);
			mav.addObject("dirList", dirList);
			// 회원 저장 여부 체크
			contents = service.isThisSaved(userNo, contents);
			// 회원 좋아요 여부 체크
			contents = service.isThisLiked(userNo, contents);
		}

		mav.setViewName("search/contents_detail");
		mav.addObject("contents", contents);
		mav.addObject("memoList", memoList);
		
		return mav;
	}

	/* 큐레이션 */
	@RequestMapping("/contents/curation.do")
	public String curation(Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");

		// 전체 유저가 많이 본 콘텐츠 top 3 (쿼리 수정 완료)
		List<ContentsVO> popularList = service.selectPopularList();
		model.addAttribute("popularList", popularList);

		// 내가 제일 많이 담은 사이트의 콘텐츠 중 전체 유저가 많이 본 콘텐츠 top 3
		List<ContentsVO> customSourceList = service.selectCustomSourceList(member.getNo());
		model.addAttribute("customSourceList", customSourceList);

		// 관심 키워드 & 검색 키워드 해당 콘텐츠 중 전체 유저가 많이 본 콘텐츠 top 3
		List<ContentsVO> customKeywordList = service.selectCustomKeywordList(member.getNo());
		model.addAttribute("customKeywordList", customKeywordList);

		return "contents/curation";
	}

	/* 내 검색어 */
	@RequestMapping("/contents/my_search.do")
	public String my_search(Model model, @RequestParam("memberNo") int memberNo) {
		List<KeywordsVO> keywordList = service.selectKeywordList(memberNo);
		model.addAttribute("keywordList", keywordList);

		// System.out.println("keywordList controller : " + keywordList);

		return "contents/my_search";
	}

	@RequestMapping("/contents/update_status.do")
	public String updateStatus(HttpSession session, @RequestParam("no") int no) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int userNo = userVO != null ? userVO.getNo() : 0;

		KeywordsVO keywords = new KeywordsVO();
		keywords.setMemberNo(userNo);
		keywords.setNo(no);

		service.updateStatus(keywords);

		return "redirect:/contents/my_search.do?memberNo=" + userNo;
	}

	// 통계 분석
	@RequestMapping("/contents/analysis.do")
	public String analysis(Model model, HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int memberNo = userVO.getNo();

		List<KeywordsVO> keywordList = service.selectKeywordList(memberNo);

		// System.out.println("controller : " + memberNo);

		return "contents/analysis";
	}

	@RequestMapping("/contents/customizing.do")
	public String customizing(Model model) {

		return "contents/customizing";
	}

	@RequestMapping("/contents/upgrade.do")
	public String upgrade(Model model) {

		return "contents/upgrade";
	}

	@RequestMapping("/contents/card_enrollform_modal.do")
	public String cardEnroll(Model model) {

		return "contents/card_enrollform_modal";
	}

	@ResponseBody
	@RequestMapping(value = "/contents/likeCntUp.do", method = RequestMethod.POST)
	public String likeCntUp(HttpSession session, @RequestParam("contentsNo") int contentsNo) {

		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int memberNo = userVO.getNo();

		ContentsVO like = new ContentsVO();
		like.setMemberNo(memberNo);
		like.setContentsNo(contentsNo);

		service.likeCntUp(like);

		// int likeCnt = service.selectLikeCnt(contentsNo);
		//
		// like.setLikeCnt(likeCnt);
		// System.out.println(likeCnt);

		return "succeed";
	}

	@ResponseBody
	@RequestMapping(value = "/contents/likeCancel.do", method = RequestMethod.POST)
	public String likeCancel(HttpSession session, @RequestParam("contentsNo") int contentsNo) {

		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int memberNo = userVO.getNo();

		ContentsVO like = new ContentsVO();
		like.setMemberNo(memberNo);
		like.setContentsNo(contentsNo);

		service.likeCancel(like);

		return "succeed";
	}

}
