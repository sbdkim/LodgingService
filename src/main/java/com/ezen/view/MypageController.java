package com.ezen.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.biz.dto.AccommodationVO;
import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.HostVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.service.AccommodationService;
import com.ezen.biz.service.BookingService;

@Controller
public class MypageController {

	@Autowired
	private BookingService bookingService;
	@Autowired
	private AccommodationService accommodationService;

	@PostMapping("booking_insert")
	public String insertBooking(BookingVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setEmail(loginUser.getEmail());
			bookingService.insertBooking(vo);
			return "redirect:mypage";

		}
	}

	@GetMapping("/booking_list")
	public String BookingListAction(HttpSession session, Model model, BookingVO vo) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setMemail(loginUser.getEmail());
			vo.setStatus(0);
			List<BookingVO> bookingList = bookingService.getListBookByEmail(vo);

			model.addAttribute("bookingList", bookingList);

			return "mypage/mypage";
		}
	}

	@GetMapping("/mypage")
	public String myPageView(HttpSession session, BookingVO vo, Model model) {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {

			vo.setMemail(loginUser.getEmail());
			vo.setBseq(vo.getBseq());
			vo.setStatus(0);
			vo.setRseq(vo.getRseq());
			vo.setTel(vo.getTel());

			List<BookingVO> bookList = bookingService.getListBookByEmail(vo);

			model.addAttribute("bookingList", bookList);

			return "mypage/mypage";

		}

	}

	@GetMapping("/booking_detail")
	public String BookingDetail(BookingVO vo, Model model) {

		vo.setBseq(vo.getBseq());
		vo.setBookdate(vo.getBookdate());
		vo.setMname(vo.getMname());
		vo.setBprice(vo.getBprice());
		vo.setAname(vo.getAname());
		vo.setRname(vo.getRname());
		vo.setCheckin(vo.getCheckin());
		vo.setCheckout(vo.getCheckout());
		vo.setStatus(vo.getStatus());
		vo.setTel(vo.getTel());
		BookingVO booking = bookingService.selectBookByBseq(vo);

		model.addAttribute("booking", booking);

		return "mypage/bookingDetail";

	}

	@RequestMapping("/booking_delete")
	public String BookingDelete(int bseq) {
		bookingService.deleteBookByBseq(bseq);
		return "redirect:mypage";
	}

	@GetMapping("/accommodation_list")
	public String AccommodationListAction(HttpSession session, Model model, AccommodationVO vo) {
		HostVO loginHost = (HostVO) session.getAttribute("loginHost");

		if (loginHost == null) {
			return "member/login";
		} else {
			vo.setHemail(loginHost.getHemail());
			List<AccommodationVO> accommodationList = accommodationService.getListHostAccommodation(vo);

			model.addAttribute("accommodationList", accommodationList);

			return "mypage/accommodationList";
		}
	}

}
