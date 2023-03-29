package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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

	
	@PostMapping("/login")
	public String loginAction(MemberVO vo, Model model) {
		int result = memberService.loginMember(vo);
		
		if(result == 1) {


	@PostMapping("/login")
	public String loginAction(MemberVO vo, Model model) {
		int result = memberService.loginMember(vo);

		if (result == 1) {

			model.addAttribute("loginUser", memberService.getMember(vo.getEmail()));

			return "redirect:index";
		} else {
			return "member/login_fail";
		}
	}

	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();  // 세션 해지
		
		return "member/login";
	}
	


	// 약정화면 표시
	@GetMapping("/contract")
	public String contractView() {
		return "member/contract";
	}

	// 회원가입 화면 표시
	@PostMapping("/join_form")
	public String joinView() {
		return "member/join";
	}

	// EMAIL 중복체크 화면 표시
	@GetMapping(value = "/email_check_form")
	public String idCheckView(MemberVO vo, Model model) {
		// email 중복확인 조회
		int result = memberService.confirmEmail(vo.getEmail());
		model.addAttribute("email", vo.getEmail());
		model.addAttribute("message", result);
		return "member/emailcheck";
	}

	// EMAIL 중복체크 수행
	@PostMapping("/email_check_form")
	public String emailCheckAction(MemberVO vo, Model model) {
		// email 중복 확인 조회
		int result = memberService.confirmEmail(vo.getEmail());
		model.addAttribute("email", vo.getEmail());
		model.addAttribute("message", result);
		return "member/emailcheck";
	}

	// 회원가입 처리
	@PostMapping("/join")
	public String joinAction(MemberVO vo) {
		memberService.insertMember(vo);
		return "member/login";
	}

}

