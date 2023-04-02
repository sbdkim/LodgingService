package com.ezen.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.ReviewService;

import utils.Criteria;
import utils.PageMaker;

@Controller
@SessionAttributes("/review")
public class ReviewController {
    
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private BookingService bookingService;
	
	
	@GetMapping(value="/list", produces="application/json; cjarset=UTF-8")
	public Map<String, Object> reviewList(ReviewVO vo, Criteria criteria){
		Map<String, Object> reviewInfo= new HashMap<>();
		//댓글 목록 조회
		List<ReviewVO> reviewList 
		=reviewService.getReviewListwithPaging(criteria, vo.getBseq());
		// 페이지 정보 작성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(reviewService.getCountReviewList(vo.getBseq()));
		
	    reviewInfo.put("total", reviewList.size());
	    reviewInfo.put("reviewList", reviewList);
	    reviewInfo.put("pageInfo", pageMaker);
	    return reviewInfo;
	}
	
	@PostMapping(value="/save")
	public String saveReviewAction(ReviewVO reviewVO, BookingVO vo, HttpSession session) {
		 MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		 if (loginUser == null) {
			 
			 return "not_logedin";
		 }else {
			reviewVO.setBseq(Integer.parseInt(loginUser.getEmail()));
		 
		//상품명 저장
		 if (reviewService.insertReview(reviewVO) > 0 ) {
			 
			 return "success";
		 }else if(vo.getStatus()!=2){
			 return "fail";
		 }else {
			 return "fail";
		 }
	}
	
	
	}
}

