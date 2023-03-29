package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.service.MemberService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//login 페이지로 이동
	@GetMapping("/login_form")
	public String loginView() {
		return "member/login";
	}
	
	
	/*
	 * 사용자 인증
	 */
	@PostMapping("/login")
	public String loginAction( MemberVO vo, 
			 Model model) {
		System.out.println(vo.getEmail());
			System.out.println("loginAction():vo="+vo);
		int result = memberService.loginMember(vo);
		
		if (result == 1) { // 로그인 성공
			model.addAttribute("loginUser", memberService.getMember(vo.getEmail()));
			
			return "redirect:index";
		} else {
			return "member/login_fail";
		}
	}
	
	
	
	
}
