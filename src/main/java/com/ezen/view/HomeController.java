package com.ezen.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.service.BookingService;



@Controller
public class HomeController {
	
	@Autowired
	private BookingService bookingService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Model model) {
		//베스트 숙소 조회 
		List<BookingVO>	bestAccommodationList =  bookingService.listBestAccom();	 
				
		model.addAttribute("bestAccommodationList", bestAccommodationList);
		
		return "index";
	}
	
	
	
	
	/*
	@GetMapping("/index")
	public String index() {
		return "index";
	
	}
	*/
	
	
	

}
