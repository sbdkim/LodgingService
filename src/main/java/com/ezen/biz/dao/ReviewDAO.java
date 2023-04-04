package com.ezen.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ReviewVO;

import utils.Criteria;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 리뷰 등록
	public int insertReview(ReviewVO vo) {
		
		 return mybatis.insert("ReviewMapper.insertReview", vo);
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

	// 리뷰 답글 달기
	public void insertReply(ReviewVO vo) {
		mybatis.update("ReviewMapper.insertReply", vo);
	}
	// 리뷰 페이징
	public List<ReviewVO> reviewListwithPaging(Criteria criteria, int rseq){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("rseq", rseq);
		return mybatis.selectList("ReviewMapper.reviewListwithPaging", map);
	}
	// 리뷰 갯수 구하기
	public int getCountReviewList(int rseq) {
		
		return mybatis.selectOne("ReviewMapper.countReviewList",rseq);
	}
	
	//리뷰 평점 구하기
	public double avgScore(int rseq) {
		return mybatis.selectOne("ReviewMapper.avgScore",rseq);
		
	}
}
