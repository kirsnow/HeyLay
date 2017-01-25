package io.planb.statics.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import io.planb.keywords.vo.KeywordsVO;
import io.planb.member.vo.MemberVO;
import io.planb.statics.service.StaticsService;
import io.planb.statics.vo.StaticsListVO;
import io.planb.statics.vo.StaticsVO;

@Controller
public class StaticsController {
	
	@Autowired
	private StaticsService service;
	
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
	@RequestMapping("/statics/sourceType.do")
	public StaticsListVO selectSourceType(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		int no = member.getNo();
		
//		System.out.println("controller no : " + no);
		
		List<StaticsVO> staticsList = service.selectSourceType(no);
		
//		System.out.println("controller staticsList : " + staticsList);
		
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
	
	
	
}
