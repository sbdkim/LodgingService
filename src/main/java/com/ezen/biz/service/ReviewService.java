package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ReviewVO;

public interface ReviewService {

	// 리뷰 등록
	void insertReview(ReviewVO vo);

	// 객실번호로 리뷰 조회
	List<ReviewVO> selectReviewByRseq(int rseq);

	// 리뷰수정
	void updateReview(int reseq);

	// 리뷰삭제
	void deleteReview(int reseq);

}