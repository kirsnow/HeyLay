package io.planb.test;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/test")
@Controller
public class ModalTest {

	@RequestMapping(value = "/testForm", method = RequestMethod.GET)
	public String testForm(HttpServletRequest request, @RequestParam Map<String, Object> param, Model model) throws Exception {
		/*if (!adminMemberService.isPermit(AdminMember.WEB)) {
			return "/admin/permission.noTiles";
		} else {
			model.addAttribute("permission", adminMemberService.getPermission());
		}*/
		return "/admin/sale/testForm.noTiles";
	}
	
}
