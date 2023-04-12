package com.ezen.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ezen.biz.dto.HostVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.service.AdminService;
import com.ezen.biz.service.HostService;
import com.ezen.biz.service.MemberService;

import utils.Criteria;
import utils.PageMaker;

@Controller
@SessionAttributes({ "loginUser", "loginHost" })
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private HostService hostService;

	@Autowired
	private AdminService adminService;

	// login 페이지로 이동

	@GetMapping("/login_form")
	public String loginView() {
		return "member/login";
	}

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

	@PostMapping("/hostlogin")
	public String loginAction(HostVO vo, Model model) {
		System.out.println(vo.toString());
		String hostEmail = vo.getHemail();
		
		// admin login
		if (hostEmail.equals("kozynest0330@gmail.com") || hostEmail.equals("kozynest1104@gmail.com")
				|| hostEmail.equals("kozynest0116@gmail.com") || hostEmail.equals("kozynest0331@gmail.com") || hostEmail.equals("kozynest862@gmail.com")) {
			System.out.println(hostEmail);
			int result = adminService.loginAdmin(vo);

			if (result == 1) {

				model.addAttribute("loginAdmin", adminService.getAdmin(vo.getHemail()));

				return "redirect:admin_hostList";
			} else {
				return "host/login_fail";
			}

		} else {
			
			// host login
			int result = hostService.loginHost(vo);
			HostVO host = hostService.getHost(hostEmail);
			int status = host.getStatus(); 
			if (result == 1 && status == 1) {
				System.out.println("status : " + vo.getStatus());
				
				
				model.addAttribute("loginHost", hostService.getHost(vo.getHemail()));
				
				return "redirect:index";
			}else {
				return "host/login_fail";

			}
			
		}

	}

	@GetMapping("/logout")
	public String logout(SessionStatus status) {

		status.setComplete(); // 세션 해지

		return "redirect:index";
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
	public String emailCheckView(MemberVO vo, Model model) {
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

	// EMAIL 중복체크 화면 표시
	@GetMapping(value = "/host_email_check_form")
	public String hostEmailCheckView(HostVO vo, Model model) {
		// email 중복확인 조회
		int result = hostService.confirmEmail(vo.getHemail());
		model.addAttribute("hemail", vo.getHemail());
		model.addAttribute("message", result);
		return "member/hostemailcheck";
	}

	// EMAIL 중복체크 수행
	@PostMapping("/host_email_check_form")
	public String hostEmailCheckAction(HostVO vo, Model model) {
		// email 중복 확인 조회
		int result = hostService.confirmEmail(vo.getHemail());
		model.addAttribute("hemail", vo.getHemail());
		model.addAttribute("message", result);
		return "member/hostemailcheck";
	}

	// 회원가입 처리
	@PostMapping("/join")
	public String joinAction(MemberVO vo) {
		memberService.insertMember(vo);
		return "member/login";
	}

	// 사업자 회원가입 처리
	@PostMapping("/hostjoin")
	public String hostJoinAction(HostVO vo) {
		hostService.insertHost(vo);
		return "member/login";
	}

	@GetMapping("/find_email_form")
	public String findEmailFormVIew() {
		return "member/findEmailAndPassword";
	}

	@PostMapping("/find_email")
	public String findEmailAction(MemberVO vo, Model model) {
		String email = memberService.selectEmailByNamePhone(vo);
		if (email != null) { // 아이디 조회 성공
			model.addAttribute("message", 1);
			model.addAttribute("email", email);
		} else {
			model.addAttribute("message", -1);
		}
		return "member/findResult"; // 아이디 조회결과 화면표시
	}

	@PostMapping("/find_pwd")
	public String findPwdAction(MemberVO vo, Model model) {
		String pwd = memberService.selectPwdByEmailNamePhone(vo);
		String email = memberService.selectEmailByNamePhone(vo);
		if (pwd != null) { // 아이디 조회 성공
			model.addAttribute("message", 1);
			model.addAttribute("email", email);
			model.addAttribute("pwd", pwd);
		} else {
			model.addAttribute("message", -1);
		}
		return "member/findPwdResult"; // 비밀번호 조회결과 화면표시
	}

	@PostMapping("/change_pwd")
	public String changePwdAction(MemberVO vo) {
		memberService.changePwd(vo);
		return "member/changePwdOk";
	}

	@GetMapping("/find_host_email_form")
	public String findHostEmailFormVIew() {
		return "member/findHostEmailAndPassword";
	}

	@PostMapping("/find_host_email")
	public String findHostEmailAction(HostVO vo, Model model) {
		String hemail = hostService.selectEmailByNamePhone(vo);
		if (hemail != null) { // 아이디 조회 성공
			model.addAttribute("message", 1);
			model.addAttribute("hemail", hemail);
		} else {
			model.addAttribute("message", -1);
		}
		return "member/findResult"; // 아이디 조회결과 화면표시
	}

	@PostMapping("/find_host_pwd")
	public String findHostPwdAction(HostVO vo, Model model) {
		String pwd = hostService.selectPwdByEmailNamePhone(vo);
		String hemail = hostService.selectEmailByNamePhone(vo);
		if (pwd != null) { // 아이디 조회 성공
			model.addAttribute("message", 1);
			model.addAttribute("hemail", hemail);
			model.addAttribute("pwd", pwd);
		} else {
			model.addAttribute("message", -1);
		}
		return "member/findHostPwdResult"; // 비밀번호 조회결과 화면표시
	}

	@PostMapping("/change_host_pwd")
	public String changeHostPwdAction(HostVO vo) {
		hostService.changePwd(vo);
		return "member/changePwdOk";
	}
}
