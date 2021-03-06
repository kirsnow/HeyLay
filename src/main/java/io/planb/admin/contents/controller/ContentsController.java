package io.planb.admin.contents.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import io.planb.admin.contents.service.ContentsService;
import io.planb.bug.vo.BugVO;
import io.planb.bugAttach.vo.BugAttachVO;
import io.planb.contents.vo.DataTypeVO;
import io.planb.source.vo.SourceVO;

@Controller
public class ContentsController {
	
	@Autowired
	private ContentsService service;
	
	/* 선택한 option 해당 사이트 목록 조회 (ajax) */
	@RequestMapping("/jsp/admin/source_list.do")
	public String selectByOption(HttpServletRequest request, Model model) {
		int option = 0;
		if(request.getParameter("option") != null) option = Integer.parseInt(request.getParameter("option"));
		
		List<DataTypeVO> dataTypeList = service.selectDataType();
		model.addAttribute("dataTypeList", dataTypeList);
		
		List<SourceVO> sourceList = service.selectByOption(option);
		model.addAttribute("sourceList", sourceList);
		
		int sourceCnt = service.countSource(option);
		model.addAttribute("sourceCnt", sourceCnt);
		
		model.addAttribute("option", option);
		
		return "admin/source";
	}
	
	/* 사이트 추가 */
	@RequestMapping(value = "/jsp/admin/source_add.do", method = RequestMethod.POST)
	public String insertSource(/*@RequestParam("attachfile") MultipartFile multipartFile, */@ModelAttribute SourceVO source) {
//		System.out.println("source : " + source);
		
		service.insertSource(/*multipartFile, */source);
		
		return "redirect:/jsp/admin/source_list.do";
	}
	
	/* 사이트 삭제 (여러 개) */
	@ResponseBody
	@RequestMapping(value="/jsp/admin/source_delete.do", method=RequestMethod.POST)
	public String deleteSource(@RequestParam(value="checkboxValues[]") List<Integer> param) {
		ArrayList<Integer> list = new ArrayList<>();
        list.addAll(param);
		
		service.deleteSource(list);
		
		return "완료";
	}
	
	/* 사이트 삭제 (단일) */
	@RequestMapping(value="/jsp/admin/source_delete.do", method=RequestMethod.GET)
	public String deleteSource(@RequestParam("no") int no) {
		service.deleteSource(no);
		
		return "redirect:/jsp/admin/source_list.do";
	}
	
	/* 사이트 차단 (여러개) -2 */
	@ResponseBody
	@RequestMapping(value="/jsp/admin/source_block.do", method=RequestMethod.POST)
	public String banSource(@RequestParam(value="checkboxValues[]") List<Integer> param) {
		ArrayList<Integer> list = new ArrayList<>();
		list.addAll(param);
		
		service.banSource(list);
		
		return "완료";
	}
	
	/* 사이트 차단 (단일) -2 */
	@RequestMapping(value="/jsp/admin/source_block.do", method=RequestMethod.GET)
	public String banSource(@RequestParam(value="no") int no) {
		service.banSource(no);
		
		return "redirect:/jsp/admin/source_list.do";
	}
	
	/* 오류 목록 조회 */
	@RequestMapping("/jsp/admin/bug_list.do")
	public String selectBugList(Model model) {
		List<BugVO> bugList = service.selectBugList();
		model.addAttribute("bugList", bugList);
		
		List<BugAttachVO> bugAttachList = service.selectBugAttachList();
		model.addAttribute("bugAttachList", bugAttachList);
		
		return "admin/bug_list";
	}
	
	/* 오류 신고 글 상세 조회 */
	@RequestMapping("/jsp/admin/bug_detail.do")
	public String selectBugDetail(@RequestParam("no") int no, Model model) {
		BugVO bug = service.selectBugDetail(no);
		model.addAttribute("bug", bug);
		
		BugAttachVO bugAttach = service.selectBugAttachDetail(no);
		model.addAttribute("bugAttach", bugAttach);
		
		return "admin/bug_detail";
	}
	
	/* 오류 신고 삭제 */
	@RequestMapping("/jsp/admin/bug_delete.do")
	public String deleteBug(@RequestParam("no") int no) {
		service.deleteBug(no);
		
		return "redirect:/jsp/admin/bug_list.do";
	}
}
