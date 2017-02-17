package io.planb.share.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ShareController {

	@RequestMapping("/share/faceBook.do")
	public String faceBookShare(@RequestParam("no") int no) {
		
		String url = "http://localhost:8000/Quration/search/contents.do?no="+no;
		
		return "http://www.facebook.com/sharer/sharer.php?u=" + url;
	}
}
