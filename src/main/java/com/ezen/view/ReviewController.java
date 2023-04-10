package com.ezen.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@GetMapping(value = "/list", produces = "application/json; cjarset=UTF-8")
	public Map<String, Object> reviewList(ReviewVO reviewVO, @RequestParam(value = "rseq") int rseq, Criteria criteria,
			Model model) {

		Map<String, Object> reviewInfo = new HashMap<>();

		// 댓글 목록 조회
		List<ReviewVO> reviewList = reviewService.getReviewListwithPaging(criteria, rseq);

		System.out.println("rseq= " + reviewVO.getRseq());

		// 페이지 정보 작성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(reviewService.getCountReviewList(rseq));

		reviewInfo.put("total", reviewList.size());
		reviewInfo.put("reviewList", reviewList);
		reviewInfo.put("pageInfo", pageMaker);

		return reviewInfo;
	}

	@PostMapping(value = "/save")
	public String saveReviewAction(ReviewVO reviewVO, @RequestParam(value = "rating") int[] rating,
			@RequestParam(value = "rseq") int rseq, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		System.out.println("넘어온 별점:" + reviewVO.getScore());
		System.out.println("넘어온 댓글:" + reviewVO.getContent());
		reviewVO.setRseq(rseq);
		if (loginUser == null) {

			return "not_logedin";
		} else {
			System.out.println(">>>>> Rating");
			for (int i = 0; i < rating.length; i++) {
				System.out.println(rating[i]);
				 reviewVO.setScore(rating[i]);
			}
			reviewVO.setEmail(loginUser.getEmail());
		
			// 상품명 저장
			if (reviewService.insertReview(reviewVO) > 0 ) {

				return "success";
			} else {
				return "fail";
			}
		}

	}

	@RequestMapping(value = "/delete", produces = "application/json; cjarset=UTF-8")
	public String reviewDelete(ReviewVO vo, MemberVO memberVO, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {

			return "not_logedin";
		} else {
			vo.setEmail(loginUser.getEmail());
			System.out.println("email: " + vo.getEmail());
			System.out.println("reseq: " + vo.getReseq());
			reviewService.deleteReview(vo);

			return "success";
		}
	}

}
