package com.ezen.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.biz.dto.AccommodationVO;
import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.HostVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.RoomVO;
import com.ezen.biz.service.AccommodationService;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.RoomService;

@Controller
public class MypageController {

	@Autowired
	private BookingService bookingService;
	@Autowired
	private AccommodationService accommodationService;
	@Autowired
	private RoomService roomService;

	@PostMapping("booking_insert")
	public String insertBooking(BookingVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setEmail(loginUser.getEmail());
			bookingService.insertBooking(vo);

			return "mypage/bookingList";
		}
	}

	@GetMapping("/booking_list")
	public String BookingListAction(HttpSession session, Model model, BookingVO vo) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
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

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
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
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {

			vo.setEmail(loginUser.getEmail());
			vo.setStatus(0);
			List<BookingVO> bookingList = bookingService.getListBookByEmail(vo);

			BookingVO bookingDetail = new BookingVO();
			bookingDetail.setBookdate(bookingList.get(0).getBookdate());
			bookingDetail.setBseq(bookingList.get(0).getBseq());
			bookingDetail.setEmail(bookingList.get(0).getEmail());
			bookingDetail.setBprice(bookingList.get(0).getBprice());

			model.addAttribute("bookingDetail", bookingDetail);
			model.addAttribute("bookingList", bookingList);

			return "mypage/bookingDetail";
		}
	}

	@GetMapping("/accommodation_list")
	public String AccommodationListAction(HttpSession session, Model model, AccommodationVO vo) {
		HostVO loginHost = (HostVO) session.getAttribute("loginHost");

		if (loginHost == null) {
			return "member/login";
		} else {
			vo.setEmail(loginHost.getEmail());
			List<AccommodationVO> accommodationList = accommodationService.getListHostAccommodation(vo);

			model.addAttribute("accommodationList", accommodationList);

			return "mypage/accommodationList";
		}
	}


}
