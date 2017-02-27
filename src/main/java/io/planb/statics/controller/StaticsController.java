package io.planb.statics.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import io.planb.contents.vo.ContentsVO;
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
	public String stats(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
		/* 담은 카드 총 개수 */
		int countTotalSaved = service.countTotalSaved(no);
		model.addAttribute("countTotalSaved", countTotalSaved);
		
		/* 오늘 담은 카드 개수 */
		int countTodaySaved = service.countTodaySaved(no);
		model.addAttribute("countTodaySaved", countTodaySaved);
		
		/* 어제 담은 카드 개수 */
		int countYesSaved = service.countYesSaved(no);
		model.addAttribute("countYesSaved", countYesSaved);
		
		/* 그제 담은 카드 개수 */
		int countBeforeYesSaved = service.countBeforeYesSaved(no);
		model.addAttribute("countBeforeYesSaved", countBeforeYesSaved);
		
		/* 월 평균 저장 개수 */
		int averageSavedMonth = service.sumSavedMonth(no);
		model.addAttribute("averageSavedMonth", averageSavedMonth);
		
		/* 제일 좋아요 많이 누른 사이트 3 */
		List<StaticsVO> likeSourceList = service.selectLikeSource(no);
		model.addAttribute("likeSourceList", likeSourceList);
		
		/* 내가 담은 카드들 중 다른 사람들이 많이 담은 카드 3 */
		List<ContentsVO> savedMoreSavedList = service.selectSavedMoreSaved(no);
		model.addAttribute("savedMoreSavedList", savedMoreSavedList);
		
		/* 내가 담은 카드들 중 다른 사람들은 안 담은 카드 3 */
		List<ContentsVO> savedLessSavedList = service.selectSavedLessSaved(no);
		model.addAttribute("savedLessSavedList", savedLessSavedList);
		
		/* 내가 담은 카드들 중 다른 사람들이 좋아요 많이 누른 카드 10 */
		List<ContentsVO> savedLikeList = service.selectSavedLike(no);
		model.addAttribute("savedLikeList", savedLikeList);
		
		return "contents/stats";
	}
	
	/* 월 저장 개수 (d3) */
	@ResponseBody
	@RequestMapping("/statics/savedMonth.do")
	public StaticsListVO selectSavedMonth(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
		List<StaticsVO> staticsList = service.selectSavedMonth(no);
		
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
	public StaticsListVO selectAllCntContents(Model model , StaticsVO columnName) {
		List<StaticsVO> contentStaticsList = service.selectAllCntContents();
		
		model.addAttribute("columnName", columnName);
		//System.out.println("controller contentStaticsList : " + contentStaticsList);
		
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
	
	/*신규 가입 유저 수 확인 */
	@ResponseBody
	@RequestMapping("/admin/statics/newUserCnt.do")
	public int selectNewUserCnt() {
		int newUserCnt = service.selectNewUserCnt();
		//System.out.println("controller newUserCnt : " + newUserCnt);
		return newUserCnt;
	}
	
	/*오늘의 검색 횟수 */
	@ResponseBody
	@RequestMapping("/admin/statics/serachToday.do")
	public int selectSerachToday() {
		int serachToday = service.selectSerachToday();
		//System.out.println("controller serachToday : " + serachToday);
		return serachToday;
	}
	
	/*오늘의 인기 키워드 */
	@ResponseBody
	@RequestMapping("/admin/statics/popularKeyword.do")
	public String selectPopularKeyword() {
		String popularKeyword = service.selectPopularKeyword();
		//System.out.println("controller popularKeyword : " + popularKeyword);
		return popularKeyword;
	}
	
	/*오늘 저장된 컨텐츠 */
	@ResponseBody
	@RequestMapping("/admin/statics/savedContent.do")
	public int selectSavedContent() {
		int savedContent = service.selectSavedContent();
		//System.out.println("controller savedContent : " + savedContent);
		return savedContent;
	}
	
}
