package io.planb.statics.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import io.planb.keywords.vo.KeywordsVO;
import io.planb.member.vo.MemberVO;
import io.planb.statics.service.StaticsService;
import io.planb.statics.vo.StaticsListVO;
import io.planb.statics.vo.StaticsVO;

@Controller
public class StaticsController {
	
	@Autowired
	private StaticsService service;
	
	/* 유저 통계 */
	
	/* 통계 자세히 보기 페이지로 이동 */
	@RequestMapping("/contents/stats.do")
	public String stats() {
		
		return "contents/stats";
	}
	
	/* 내가 많이 담은 사이트 */
	@ResponseBody
	@RequestMapping("/statics/savedSource.do")
	public StaticsListVO selectSavedSource(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
//		System.out.println("controller no : " + no);
		
		List<StaticsVO> staticsList = service.selectSavedSource(no);
		
//		System.out.println("controller staticsList : " + staticsList);
		
		return new StaticsListVO(staticsList);
	}
	
	/* 내가 많이 담은 사이트 타입 */
	@ResponseBody
	@RequestMapping("/statics/savedSourceType.do")
	public StaticsListVO selectSavedSourceType(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
		List<StaticsVO> staticsList = service.selectSavedSourceType(no);
		
		return new StaticsListVO(staticsList);
	}
	
	/* 내가 좋아하는 콘텐츠가 많은 사이트 */
	@ResponseBody
	@RequestMapping("/statics/likeSource.do")
	public StaticsListVO selectLikeSource(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
		List<StaticsVO> staticsList = service.selectLikeSource(no);
		
		return new StaticsListVO(staticsList);
	}
	
	/* 내가 좋아하는 콘텐츠가 많은 사이트 유형 */
	@ResponseBody
	@RequestMapping("/statics/likeSourceType.do")
	public StaticsListVO selectLikeSourceType(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
		List<StaticsVO> staticsList = service.selectLikeSourceType(no);
		
		return new StaticsListVO(staticsList);
	}

	/*jsp 워드 크라우드*/
	@RequestMapping("wordCloud.do")
	public String wordCloud(Model model, HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int memberNo = userVO.getNo();
		
		List<StaticsVO> wordCloudList = service.selectwordCloudList(memberNo);
		model.addAttribute("wordCloudList", wordCloudList);
		
		return "contents/word_cloud";
	}
	
	/*ajax호출용 워드 크라우드*/
	@ResponseBody
	@RequestMapping("/statics/word_cloud.do")
	public StaticsListVO selectSourceName(HttpSession session, Model model) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		int memberNo = userVO.getNo();
		
		List<StaticsVO> wordCloudList = service.selectwordCloudList(memberNo);
		
		/*System.out.println("controller wordCloudList : " + wordCloudList);
		System.out.println("controller : " + memberNo);*/
		
		return new StaticsListVO(wordCloudList);
	}
	
	/*전체 유저 키워드 part*/
	
	/*jsp 워드 크라우드*/
	@RequestMapping("AllUserWordCloud.do")
	public String analysis(Model model, StaticsVO columnName) {
		
		List<StaticsVO> AllWordCloudList = service.selectAllUserWordCloudList(columnName);
		model.addAttribute("AllWordCloudList", AllWordCloudList);
		
		return "contents/all_word_cloud";
	}
	
	/*ajax호출용 워드 크라우드*/
	@ResponseBody
	@RequestMapping("/statics/AllUserWordCloud.do")
	public StaticsListVO AllUserWordCloudList(Model model, StaticsVO columnName) {
		
		
		List<StaticsVO> AllWordCloudList = service.selectAllUserWordCloudList(columnName);
		model.addAttribute("columnName", columnName);
		
		/*System.out.println("controller ajax : " + AllWordCloudList);*/
		
		return new StaticsListVO(AllWordCloudList);
	}
	
	
	/* 관리자 통계 */
	
	/* 전체 회원 많이 담은 사이트 */
	@ResponseBody
	@RequestMapping("/admin/statics/savedSource.do")
	public StaticsListVO selectAllSavedSource(Model model) {
		List<StaticsVO> staticsList = service.selectAllSavedSource();
		
//		System.out.println("controller staticsList : " + staticsList);
		
		return new StaticsListVO(staticsList);
	}
	
	/* 전체 회원 많이 담은 사이트 타입 */
	@ResponseBody
	@RequestMapping("/admin/statics/sourceType.do")
	public StaticsListVO selectAllSourceType(Model model) {
		List<StaticsVO> staticsList = service.selectAllSourceType();
		
//		System.out.println("controller staticsList : " + staticsList);
		
		return new StaticsListVO(staticsList);
	}
	
	/*회원 전체의 조회수가 높은 콘텐츠 가로형 막대 그래프*/
	@ResponseBody
	@RequestMapping("/admin/statics/cntContents.do")
	public StaticsListVO selectAllCntContents(Model model , StaticsVO columnName, StaticsVO cnt) {
		List<StaticsVO> contentStaticsList = service.selectAllCntContents();
		
		model.addAttribute("columnName", columnName);
		System.out.println("controller contentStaticsList : " + contentStaticsList);
		
		return new StaticsListVO(contentStaticsList);
	}
	
	/*회원 전체의 조회수가 높은 사이트*/
	@ResponseBody
	@RequestMapping("/admin/statics/cntCite.do")
	public StaticsListVO selectCiteContents() {
		List<StaticsVO> citeStaticsList = service.selectCiteContents();
		
		/*System.out.println("controller citeStaticsList : " + citeStaticsList);*/
		
		return new StaticsListVO(citeStaticsList);
	}
	
	/*전체 키워드 랭킹*/
	@RequestMapping("/admin/statics/allKeywordList.do")
	public ModelAndView allKeywordList() {
		
		ModelAndView mav = new ModelAndView();
		List<KeywordsVO> allKeywordList = service.selectAllKeywordList();
		
		mav.setViewName("admin/search_list");
		mav.addObject("allKeywordList", allKeywordList);
		
		//System.out.println("allKeywordList controller : " + allKeywordList);
		
		return mav;
	}
}
