package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ReviewVO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 리뷰 등록
	public void insertReview(ReviewVO vo) {
		mybatis.insert("ReviewMapper.insertReview", vo);
	}

	// 객실번호로 리뷰 조회
	public List<ReviewVO> selectReviewByRseq(int rseq) {
		return mybatis.selectList("ReviewMapper.selectReviewByRseq", rseq);
	}

	// 리뷰수정
	public void updateReview(ReviewVO vo) {
		mybatis.update("ReviewMapper.updateReview", vo);
	}

	// 리뷰삭제
	public void deleteReview(int reseq) {
		mybatis.delete("ReviewMapper.deleteReview", reseq);
	}

	// 전체 리뷰 조회
	public List<ReviewVO> getListReview() {
		return mybatis.selectList("ReviewMapper.getListReview");
	}
}
