package com.ezen.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ezen.biz.dto.AdminVO;
import com.ezen.biz.dto.QnaVO;
import com.ezen.biz.service.AdminService;
import com.ezen.biz.service.QnaService;

@Controller
@SessionAttributes("admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/admin_login_form")
	public String adminLoginView() {
		return "admin/main";
	}// adminLoginView

	@PostMapping("/admin_login")
	public String adminLogin(AdminVO vo, Model model) {
		// (1) 관리자 ID 인증
		int result = adminService.adminCheck(vo);

		// (2) 정상적인 관리자이면
		// 관리자 정보 조회
		// 상품 목록 화면으로 이동
		if (result == 1) {
			model.addAttribute("admin", adminService.getAdmin(vo.getEmail()));
			return "redirect:admin_product_list";
		} else {
			// (3) 비정상적인 관리자이면
			// 메시지를 설정하고 로그인화면으로 이동
			if (result == 0) {
				model.addAttribute("message", "비밀번호를 확인해 주세요.");
			} else {
				model.addAttribute("message", "아이디를 확인해 주세요.");
			}
			return "admin/main";
		}
	}// adminLogin

	@GetMapping("/admin_logout")
	public String adminLogout(SessionStatus status) {
		status.setComplete();
		return "admin/main";
	}// adminLogout
	
	
	@RequestMapping("/admin_qna_list")
	public String admingQnaList(Model model) {
		List<QnaVO> qnaList=qnaService.getListAllQna();
		model.addAttribute("qnaList", qnaList);
		return "admin/qna/qnaList";
	}//adminQnaList
	
	
	@PostMapping("/admin_qna_detail")
	public String adminQnaDetail(Model model, QnaVO vo) {
		QnaVO qna= qnaService.getQna(vo.getQseq());
		model.addAttribute("qnaVO", qna);
		return "admin/qna/qnaDetail";
	}//adminQnaDetail
	
	
	@PostMapping("/admin_qna_repsave")
	public String adminQnaRepSave(Model model,QnaVO vo) {
		qnaService.updateQna(vo);
		return "redirect:admin_qna_list";	
		}//adminQnaRepSave
	
	
	   //상품별 판매 실적 화면 출력
	@RequestMapping("/admin_booking_record_form")
		public String adminProductSalesForm() {
		  return "admin/order/salesRecords";
	    }
		
	
	
}// class
