package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ezen.biz.service.MemberService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login_form")
	public String loginView() {
		return "member/login";
	}
	
}
