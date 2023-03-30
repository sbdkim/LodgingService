package com.ezen.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.service.BookingService;

@Controller
public class MypageController {

	@Autowired
	private BookingService bookingService;

	@PostMapping("booking_insert")
	public String insertBooking(BookingVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setEmail(loginUser.getEmail());
			bookingService.insertBooking(vo);

			return "redirect:booking_list";
		}
	}

	@GetMapping("/booking_list")
	public String listBookByEmail(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			List<BookingVO> bookingList = bookingService.getListBookByEmail(loginUser.getEmail());

			int totalAmount = 0;
			BookingVO vo = new BookingVO();

			totalAmount += vo.getPrice()
					* (Integer.parseInt(vo.getCkoutdate()) - Integer.parseInt(vo.getCkindate()) + 1);

			model.addAttribute("bookingList", bookingList);
			model.addAttribute("totalPrice", totalAmount);

			return "mypage/bookingList";
		}
	}

	@GetMapping("/mypage")
	public String myPageView(HttpSession session, BookingVO vo, Model model) {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			System.out.println("된다");
			vo.setEmail(loginUser.getEmail());
			vo.setStatus(0); // 예약대기
			List<Integer> bseqList = bookingService.getSeqBooking(vo);

			List<BookingVO> summaryList = new ArrayList<>();

			BookingVO booking = new BookingVO();
			int bseq = booking.getBseq();

			booking.setEmail(loginUser.getEmail());
			booking.setBseq(bseq);
			booking.setStatus(0);
			List<BookingVO> bookingList = bookingService.getListBookingByEmail(booking);

			BookingVO summary = new BookingVO();
			summary.setBseq(bookingList.get(0).getBseq());
			summary.setBookdate(bookingList.get(0).getBookdate());

			summaryList.add(summary);

			model.addAttribute("bookingList", summaryList);

		}

		return "mypage/mypage";
	}

}
