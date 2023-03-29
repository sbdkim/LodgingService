package com.ezen.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.service.BookingService;

@Controller
public class MypageController {
	
	@Autowired
	private BookingService bookingService;
	
//	@PostMapping("/booking_insert")
//	public String insertBooking(BookingVO vo, HttpSession session, Model model) {
//		// 로그인 ghkrdls
//		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
//		
//		if(loginUser == null) {
//			return "member/login";
//		} else {
//			
//			//booking 객체에 회원 email 설정
//			vo.setEmail(loginUser.getEmail());
//			
//			int bseq = bookingService.insertBooking(vo);
//			
//			model.addAttribute("bseq", bseq);
//			
//			return "redirect:booking_list";
//		}
//	}
	
	@GetMapping("/booking_list")
	public String BookingListAction(BookingVO vo, HttpSession session, Model model) {
		//로그인 확인
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "member/login";
		} else {
			vo.setEmail(loginUser.getEmail());
			vo.setStatus(0);
			List<BookingVO> bookingList = bookingService.getListBookByNameEmail(vo);
			
			int totalAmount = 0;
			for(BookingVO booking : bookingList) {
				totalAmount += booking.getPrice()*((Integer.parseInt(booking.getCkoutdate()))-(Integer.parseInt(booking.getCkindate()))+1);
			}
			
			model.addAttribute("bookingList", bookingList);
			model.addAttribute("totalPrice", totalAmount);
			
			return "mypage/bookingList";
		}
		
		
	}
	
	@RequestMapping("/mypage")
	public String myPageView(HttpSession session, BookingVO vo, Model model) {
		//로그인 확인
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "member/login";
		} else {
			vo.setEmail(loginUser.getEmail());
			vo.setStatus(0);
			List<Integer> bseqList = bookingService.getSeqBooking(vo);
			
			List<BookingVO> summaryList = new ArrayList<>();
			for(int bseq : bseqList) {
				BookingVO booking = new BookingVO();
				
				booking.setEmail(loginUser.getEmail());
				booking.setBseq(bseq);
				booking.setStatus(0);
				List<BookingVO> bookingList = bookingService.getListBookByNameEmail(booking);
				
				BookingVO summary = new BookingVO();
				summary.setBseq(bookingList.get(0).getBseq());
				summary.setBookdate(bookingList.get(0).getBookdate());
				
//				summaryList.add(summary);
			}
			
			model.addAttribute("bookingList", summaryList);
//			model.addAttribute("title", "예약 완료");
		}
		
		return "mypage/mypage";
	}

}
