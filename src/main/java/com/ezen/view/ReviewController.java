package com.ezen.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.service.ReviewService;

import utils.Criteria;
import utils.PageMaker;

@RestController
@RequestMapping("/review")
public class ReviewController {
    
	@Autowired
	private ReviewService reviewService;
	
	
	@GetMapping(value="/list", produces="application/json; cjarset=UTF-8")
	public Map<String, Object> reviewList(ReviewVO vo, Criteria criteria){
		Map<String, Object> reviewInfo= new HashMap<>();
		//댓글 목록 조회
		List<ReviewVO> reviewList=reviewService.getReviewListwithPaging(criteria, vo.getBseq());
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
	public String saveReviewAction(
			@RequestParam(value="rseq") int rseq,
			ReviewVO reviewVO,HttpSession session) {
		 MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		 if (loginUser == null) {
			 
			 return "not_logedin";
		 }else {
			reviewVO.setEmail(loginUser.getEmail());
		 
		//상품명 저장
		 if (reviewService.insertReview(reviewVO,  rseq) > 0 ){
			 
			 return "success";
		 }else {
			 return "fail";
		 }
	}
	
	
	}
}

