package com.ezen.biz.dao;

import java.util.HashMap;
import java.util.List;

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
	public  void deleteReview(ReviewVO vo) {
		System.out.println("email: " + vo.getEmail());
		System.out.println("reseq: " + vo.getReseq());
		mybatis.delete("ReviewMapper.deleteReview", vo);
	}

	// 전체 리뷰 조회
	public List<ReviewVO> getListReview() {
		return mybatis.selectList("ReviewMapper.getListReview");
	}

	// 리뷰 답글 달기
	public void insertReply(ReviewVO vo) {
		mybatis.update("ReviewMapper.insertReply", vo);
	}
	
	public List<ReviewVO> reviewListwithPaging(Criteria criteria, int rseq){	
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("rseq", rseq);
		List<ReviewVO> list = mybatis.selectList("ReviewMapper.reviewListwithPaging", map);
		return list;
	}
	
	public int getCountReviewList(int rseq) {
		return mybatis.selectOne("ReviewMapper.countReviewList",rseq);
	}
	
}//ReviewDAO
