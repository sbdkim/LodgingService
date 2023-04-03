package com.ezen.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.AccommodationVO;
import com.ezen.biz.service.AccommodationService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class AccommodationController {

	@Autowired
	private AccommodationService accommodationService;

	@GetMapping("/search")
	public String searchView(AccommodationVO vo, Model model) {
		System.out.println(vo.toString());
		String address = vo.getAddress();
		List<AccommodationVO> accommodationList = accommodationService.selectAccByAdd(address);
		model.addAttribute("accommodationList", accommodationList);
		return "accommodation/accList";
	}
	

	
	
	
	
	

	@RequestMapping("/acc_search_list")
	public String accSearchList(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "10") String rowsPerPage,
			@RequestParam(value = "key", defaultValue = "") String address, Model model) {

		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
		// (1) 전체 숙소목록 조회
		List<AccommodationVO> accommodationList = accommodationService.getListAccWithPaging(criteria, address);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(accommodationService.countAccList(address));

		// (3) model 객체에 숙소 목록 저장
		model.addAttribute("accommodationList", accommodationList);
		model.addAttribute("accommodationListSize", accommodationList.size());
		model.addAttribute("pageMaker", pageMaker);

		return "accommodation/accList";
	}
}
