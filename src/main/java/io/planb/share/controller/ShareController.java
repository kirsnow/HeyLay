package io.planb.share.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareController {

	@RequestMapping("/share/faceBook.do")
	public String faceBookShare(String PAGE_URL) {
		
		
		return "redirect:/http://www.facebook.com/sharer/sharer.php?u=" + PAGE_URL;
	}
}
