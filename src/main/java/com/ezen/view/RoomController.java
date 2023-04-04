package com.ezen.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.AccommodationVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.RoomVO;
import com.ezen.biz.service.AccommodationService;
import com.ezen.biz.service.RoomService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;
	@Autowired
	private AccommodationService accommodationService;

	@RequestMapping("/room")
	public String roomView(AccommodationVO vo, Model model, int aseq) {
		String accommodationName = accommodationService.getNameByAseq(aseq);
		List<RoomVO> roomList = roomService.getRoomByAcc(aseq);
		model.addAttribute("roomList", roomList);
		model.addAttribute("accommodationName", accommodationName);
		return "room/roomList";

	}

	@RequestMapping("/selectedAccommodation")
	public String accSearchList(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "10") String rowsPerPage,
			@RequestParam(value = "key", defaultValue = "") int aseq, Model model) {

		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
		// (1) 전체 숙소목록 조회
		List<RoomVO> roomList = roomService.getRoomListWithPaging(criteria, aseq);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(roomService.countRoomList(aseq));

		// (3) model 객체에 숙소 목록 저장
		model.addAttribute("roomList", roomList);
		model.addAttribute("roomListSize", roomList.size());
		model.addAttribute("pageMaker", pageMaker);

		return "room/roomList";
	}

	@RequestMapping("/room_detail")
	public String roomDetail(RoomVO vo, Model model) {
		int rseq = vo.getRseq();
		RoomVO roomDetail = roomService.getRoomByRseq(rseq);
		model.addAttribute("roomDetail", roomDetail);
		return "room/roomDetail";
	}

	@RequestMapping("/booking")
	public String booking(HttpSession session, RoomVO vo, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
			int rseq = vo.getRseq();
			RoomVO accRoom = roomService.getAccByRseq(rseq);
			model.addAttribute("accRoom", accRoom);
			return "room/booking";
		}
	}

}// RoomController
