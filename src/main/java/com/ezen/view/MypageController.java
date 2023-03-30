package com.ezen.view;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.RoomVO;
import com.ezen.biz.service.BookingService;

import lombok.ToString;

@Controller
public class MypageController {
	
	@Autowired
	private BookingService bookingService;
	
	@PostMapping("booking_insert")
	public String insertBooking(BookingVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "member/login";
		} else {
			vo.setEmail(loginUser.getEmail());
			bookingService.insertBooking(vo);
			
			return "redirect:booking_list";
		}
	}
	
	@GetMapping("/booking_list")
	public String BookingListAction(HttpSession session, Model model,BookingVO vo) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "member/login";
		} else {
			vo.setEmail(loginUser.getEmail());
			vo.setStatus(0);
			List<BookingVO> bookingList = bookingService.getListBookByEmail(vo);
			
			
			model.addAttribute("bookingList", bookingList);
			
			return "mypage/bookingList";
		}
	}
	
	@GetMapping("/mypage")
	public String myPageView(HttpSession session, BookingVO vo, Model model) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "member/login";
		} else {
						
		
			vo.setEmail(loginUser.getEmail());
			vo.setBseq(vo.getBseq());
			vo.setStatus(0);
			vo.setRseq(vo.getRseq());
			
			List<BookingVO> bookList = bookingService.getListBookByEmail(vo);
			
					
			model.addAttribute("bookingList", bookList);
			
			return "mypage/mypage";
			
			
			
		}
		
		
	}
	
	@GetMapping("/booking_detail")
	public String BookingDetail(HttpSession session, BookingVO vo, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "member/login";
		} else {
//			vo.setEmail(loginUser.getEmail());
//			vo.setStatus(0);
//			
//			List<BookingVO> bookingDetail = bookingService.getListBookByEmail(vo);
//			
//					
//			model.addAttribute("bookingDetail", bookingDetail);
			
			return "mypage/bookingDetail";
		}
	}

}
