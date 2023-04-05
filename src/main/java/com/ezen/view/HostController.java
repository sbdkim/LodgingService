package com.ezen.view;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.biz.dto.AccommodationVO;
import com.ezen.biz.dto.HostVO;
import com.ezen.biz.dto.RoomVO;
import com.ezen.biz.dto.SalesQuantity;
import com.ezen.biz.service.AccommodationService;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.RoomService;

@Controller
public class HostController {
	
	@Autowired
	private BookingService bookingService;
	@Autowired
	private AccommodationService accommodationService;
	@Autowired
	private RoomService roomService;
	
	@PostMapping("/host_accommodation_write_form")
	public String hostAccommodationWriteView(Model model) {
		String[] categoryList = {"호텔","모텔","펜션,풀빌라","게스트 하우스"};
		
		model.addAttribute("categoryList", categoryList);
		
		return "host/accommodationWrite";
	}
	

	@PostMapping("/host_accommodation_write")
	public String hostAccommodationWrite(AccommodationVO vo, HttpSession session, 
			@RequestParam(value="default") MultipartFile uploadFile) {
		HostVO loginHost = (HostVO)session.getAttribute("loginHost");
		
		if(loginHost == null) {
			return "member/login";
		} else {
			
			vo.setHemail(loginHost.getHemail());
			
				if(!uploadFile.isEmpty()) {
					String fileName = uploadFile.getOriginalFilename();
					vo.setAimage(fileName);
					
					String image_path = session.getServletContext().getRealPath("WEB-INF/resources/accommodation_images/");
					
					try {
						uploadFile.transferTo(new File(image_path + fileName));
					} catch (IllegalStateException | IOException e) {
						
						e.printStackTrace();
					} 			
					
				} else {
					vo.setAimage("default.jpg");
				}
			
			
		}
		accommodationService.insertAccommodation(vo);
		
		
		return "redirect:host_mypage";
		
		
	}
	
	@RequestMapping("/host_acc_update_form")
	public String hostAccUpdateView(AccommodationVO vo, Model model) {
		String[] categoryList = {"호텔","모텔","펜션,풀빌라","게스트 하우스"};
		
		AccommodationVO accommodation = accommodationService.getAccommodaiton(vo);
		
		model.addAttribute("accommodationVO", accommodation);
		model.addAttribute("categoryList", categoryList);
		
		return "host/accommodationUpdate";
	}

	@PostMapping("/host_acc_update")
	public String hostAccUpdate(AccommodationVO vo,
			@RequestParam(value="accommodation_images") MultipartFile uploadFile,
			@RequestParam(value="nonmakeImg") String org_image,
			HttpSession session) {
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setAimage(fileName);
			
			String image_path = session.getServletContext().getRealPath("WEB-INF/resources/accommodation_images/");
			
			try {
				uploadFile.transferTo(new File(image_path + fileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else {
			vo.setAimage(org_image);
		}
		
		accommodationService.updateAccommodation(vo);
		
		return "redirect:host_mypage";
		
	}
	
	@GetMapping("/host_mypage")
	public String hostMyPageView(HttpSession session, AccommodationVO vo, Model model) {
		
		HostVO loginHost = (HostVO)session.getAttribute("loginHost");
		
		if(loginHost == null) {
			return "member/login";
		} else {
						
		
			vo.setHemail(loginHost.getHemail());
			
			List<AccommodationVO> accommodationList = accommodationService.getListHostAccommodation(vo);
			
					
			model.addAttribute("accommodationList", accommodationList);
			
			return "host/hostmypage";
						
		}
		
	}

	@GetMapping("/host_accommodation_list")
	public String HostAccommodationListAction(HttpSession session, Model model, AccommodationVO vo) {
		HostVO loginHost = (HostVO)session.getAttribute("loginHost");
		
		if(loginHost == null) {
			return "member/login";
		} else {
			vo.setHemail(loginHost.getHemail());
			List<AccommodationVO> accommodationList = accommodationService.getListHostAccommodation(vo);
				
			
			model.addAttribute("accommodationList", accommodationList);
			
			return "host/accommodationList";
		}
	}
	
	@GetMapping("/accommodation_detail")
	public String AccommodationDetail(HttpSession session, AccommodationVO vo, Model model) {
		HostVO loginHost = (HostVO)session.getAttribute("loginHost");
		
		if(loginHost == null) {
			return "member/login";
		} else {
			vo.setHemail(loginHost.getHemail());
			List<AccommodationVO> accommodationList = accommodationService.getListHostAccommodation(vo);
			
			AccommodationVO accommodationDetail = new AccommodationVO();
			accommodationDetail.setAseq(accommodationList.get(0).getAseq());
			accommodationDetail.setHemail(accommodationList.get(0).getHemail());
			accommodationDetail.setAname(accommodationList.get(0).getAname());
			
			
			
			int aseq = vo.getAseq();
			List<RoomVO> roomList = roomService.getRoomByAcc(aseq);
			
			RoomVO RoomDetail = new RoomVO();
			RoomDetail.setRseq(roomList.get(0).getRseq());
			RoomDetail.setRname(roomList.get(0).getRname());
			RoomDetail.setPrice(roomList.get(0).getPrice());
	
			
			model.addAttribute("accommodationDetail", accommodationDetail);
			model.addAttribute("accommodationList", accommodationList);
			model.addAttribute("roomList", roomList);
			
			return "host/accommodationDetail";
		}
	
	}
	
	@GetMapping("/hostBookingList")
	public String HostBookingListAction(HttpSession session, AccommodationVO vo, Model model) {
		HostVO loginHost = (HostVO)session.getAttribute("loginHost");
		
		if(loginHost == null) {
			return "member/login";
		} else {
			vo.setHemail(loginHost.getHemail());
			List<AccommodationVO> accommodationList = accommodationService.getListHostAccommodation(vo);
				
			
			model.addAttribute("accommodationList", accommodationList);
			
			return "host/hostBookingList";
		}
	}
	
//	@GetMapping("/host_booking_detail")
//	public String HostBookingDetail(HttpSession session, BookingVO booking, Model model) {
//		HostVO loginHost = (HostVO)session.getAttribute("loginHost");
//		
//		if(loginHost == null) {
//			return "member/login";
//		} else {
//
//			List<BookingVO> bookingList = bookingService.getBookingListByAseq(booking);
//			
//			
//			
//			BookingVO book = new BookingVO();
//			book.setBseq(bookingList.get(0).getBseq());
//			book.setRseq(bookingList.get(0).getRseq());
//			book.setBookdate(bookingList.get(0).getBookdate());
//			book.setMname(bookingList.get(0).getMname());
//			book.setCkindate(bookingList.get(0).getCkindate());
//			book.setCkoutdate(bookingList.get(0).getCkoutdate());
//			book.setRprice(bookingList.get(0).getRprice());
//			book.setBprice(bookingList.get(0).getBprice());
//			
//
//			model.addAttribute("bookingList", bookingList);
//							
//			return "host/hostBookingListDetail";
//		}
	
	
	//상품별 판매 실적 화면 출력
		@RequestMapping("/host_booking_record_form")
		public String adminProductSalesForm() {
		   return "admin/host/salesRecords";
	    }
		
	    @RequestMapping("/booking_record_chart")
		@ResponseBody//화면이 아닌 데이터를 리턴하는 메소드로 지정
		public List<SalesQuantity> salesRecordChart(HttpSession session,AccommodationVO vo){
		    HostVO loginHost = (HostVO)session.getAttribute("loginHost");
		    
		    
			vo.setHemail(loginHost.getHemail());
			List<SalesQuantity> listSales = bookingService.getListBookingSales();
			return listSales;
		}
	   }

//	}?

